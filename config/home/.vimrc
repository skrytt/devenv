set nocompatible

" Pathogen for plugin management
execute pathogen#infect()
syntax on
filetype plugin indent on

" gVim theme
set guifont=Roboto\ Mono\ for\ Powerline\ 11
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" General theme
set background=dark
colorscheme solarized

" Show a width guide column in a different colour and set the textwidth
set colorcolumn=103
highlight ColorColumn ctermbg=gray
autocmd FileType text setlocal textwidth=102

" Always show a status line
set laststatus=2

" vim-airline
let g:airline_powerline_fonts = 1
" Don't print Vim's mode a second time after vim-airline
set noshowmode

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Syntastic lang-specific customization
let g:syntastic_cpp_checkers = ['g++']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = ['--rcfile=/home/mkemp/.pylint.rcfile']
let g:syntastic_bash_checkers = ['shellcheck']
let g:syntastic_json_checkers = ['jsonlint']
let g:ycm_rust_src_path = '/usr/local/rustc-1.24.1/src'

" Shortcuts
set pastetoggle=<F2>
map <F3> :set invnumber<CR>
map <F6> :SyntasticCheck<CR>
map <F7> :lprev<CR>
map <F8> :lnext<CR>

" Tab behaviour
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Size of history buffer
set history=50

" Use the X clipboard
set clipboard=unnamedplus

" Copy indent from current line when starting a new line
set autoindent

" Allow backspacing over autoindents, line breaks and start of insert
set backspace=indent,eol,start

" Show (partial) command in the last line of the screen
set showcmd

" Incremental search and highlight all matches
set incsearch
set hlsearch

" Show tabs and EOL
set list
set listchars=tab:>>,trail:#

" Automatic directory change
set autochdir

" ctags file search path
set tags=./.tags;,.tags
