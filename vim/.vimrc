let mapleader=','
let g:coc_disable_startup_warning = 1
call plug#begin('~/.vim/plugged')

"for i3 syntax highlighting
Plug 'ervandew/supertab'
Plug 'vim-latex/vim-latex'
" for syntax highlighting in several languages
Plug 'sheerun/vim-polyglot'
" intellisense engine  
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dhruvasagar/vim-table-mode'

call plug#end()


" enable autocompletion
set wildmode=longest,list,full

set number
" key mapping switch between number and relative number
nnoremap <F3> :set relativenumber!<CR>

syntax on
set ruler
set linebreak

          " set background color of the popup menu

          highlight Pmenu ctermbg=gray guibg=gray
"enable autocompletion
set wildmode=longest,list,full

set number
"key mapping switch between number and relative number
nnoremap <F3> :set relativenumber!<CR>

syntax on
set ruler



" rmarkdown folding

function! MarkdownLevel()
	if getline(v:lnum) =~ '^# .*$'
		return ">1"
	endif
	if getline(v:lnum) =~ '^## .*$'
		return ">2"
	endif
	if getline(v:lnum) =~ '^### .*$'
		return ">3"
	endif
	if getline(v:lnum) =~ '^#### .*$'
		return ">4"
	endif
	if getline(v:lnum) =~ '^##### .*$'
		return ">5"
	endif
	if getline(v:lnum) =~ '^###### .*$'
		return ">6"
	endif
	return "=" 
endfunction

au BufEnter *.rmd setlocal foldexpr=MarkdownLevel()  
au BufEnter *.rmd setlocal foldmethod=expr     
" Change the colour of the folded line
highlight Folded ctermbg=black

" rmarkdown
autocmd Filetype rmd map <F5> :w<bar>!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
" for automatic formatting of paragraphs
autocmd BufReadPost,BufNewFile *.rmd,*.tex setlocal textwidth=100

" SNIPPETS

command Srmdhead :-1read ~/.vim/snippets/header.yaml

command Srmdpdfhead :-1read ~/.vim/snippets/pdfheader.yaml

command Srmdcodeblock :-1read ~/.vim/snippets/codeblock.rmd

command Srmdstyle :-1read~/.vim/snippets/rmdstyle.css

command Stexbeamerframe :-1read~/.vim/snippets/texframe.tex

command Stexitemize :-1read~/.vim/snippets/texitemize.tex

command Srmdknitrimg :-1read ~/.vim/snippets/knitr-img.rmd

command Srmdcomment :-1read ~/.vim/snippets/comment.rmd

