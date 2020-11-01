" Get nvim initial config from .vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

set number                                                                  
syntax on
set cursorline

set shiftwidth=2
set tabstop=1

set noexpandtab " Make sure that every file uses real tabs, not spaces
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line

" Set the tab width

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'scrooloose/nerdtree'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" NERDTree custom config
let NERDTreeQuitOnOpen=1
nmap <C-n> :NERDTreeToggle<CR>
