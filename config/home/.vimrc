set nocompatible

execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers = ['g++']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_bash_checkers = ['shellcheck']

set pastetoggle=<F2>
map <F3> :set invnumber<CR>

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
set history=50
set showcmd
set incsearch
set hlsearch
filetype plugin indent on
syntax on
set colorcolumn=103
autocmd FileType text setlocal textwidth=102
set list
set listchars=tab:>>,trail:#
set autochdir

highlight ColorColumn ctermbg=gray

set background=dark
colorscheme solarized

set laststatus=2
set noshowmode
