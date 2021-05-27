" ~/.config/nvim/init.vim
" ----------------------------------------
" Automatic installation of vim-plug, if it's not available
" ----------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"-----------------------------------------

"-----------------------------------------
" Automatically install missing plugins on startup
"-----------------------------------------
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
"-----------------------------------------

"-----------------------------------------
" Plugins
"-----------------------------------------

" Get nvim initial config from .vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

set number                                                                  
syntax on
set cursorline

set shiftwidth=2
set tabstop=1

set expandtab " Make sure that every file uses real tabs, not spaces
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line

" Set the tab width

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Plugin 'dart-lang/dart-vim-plugin'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'jupyter-vim/jupyter-vim'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'honza/vim-snippets'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" NERDTree custom config
let NERDTreeQuitOnOpen=1
nmap <C-n> :NERDTreeToggle<CR>

" Flutter custom keymapping
nmap <silent> gd <Plug>(coc-definition)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Coc snippets keymapping
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
xmap <leader>x  <xmap>(coc-convert-snippet)
"
" Word replacer shortcut
nmap <leader>r "_diw<S-p>

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

