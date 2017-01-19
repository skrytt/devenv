set nocompatible

execute pathogen#infect()
syntax on
filetype plugin indent on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_checkers = ['g++']

map <F6> :SyntasticCheck<CR>
map <F7> :lprev<CR>
map <F8> :lnext<CR>

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set autoindent
set cindent
set backspace=indent,eol,start

syntax on
set colorcolumn=103
highlight ColorColumn ctermbg=gray
