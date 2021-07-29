"** Bootstrap vim-plug **
let plug_install = 0
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    silent exe '!curl -fL --create-dirs -o ' . autoload_plug_path . 
        \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path

"** Plugins **
call plug#begin('~/.vim/plugged')
  Plug 'arcticicestudio/nord-vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/emmet-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vuciv/vim-bujo'
  Plug 'rust-lang/rust.vim'
  Plug 'ThePrimeagen/vim-be-good'
call plug#end()

" Install all plugins if first time installing vim-plug
if plug_install
    PlugInstall --sync
endif
unlet plug_install

"** Options **
syntax enable
filetype plugin indent on
set tabstop	=2      " Width of tab character
set softtabstop	=2  " Fine tunes the amount of white space to be added
set shiftwidth	=2  " Determines the amount of whitespace to add in normal mode
set expandtab       " When enabled, will use spaces instead of tabs
set scrolloff	=8    " Scrolls the window when approaching # lines from the bottom
set number          " Show line numbers
set relativenumber  " Line numbers are relative to current line
set incsearch       " Show where the pattern, as it was typed so far, matches

let g:markdown_fenced_languages = ['html', 'javascript', 'bash', 'rust']
let g:rustfmt_autosave = 1

"** Remaps **
let mapleader = " "
nnoremap <C-b> :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-b> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>y "+y
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-c> <esc>

" Bujo
nmap <C-t> <Plug>BujoAddnormal
imap <C-t> <Plug>BujoAddinsert
nmap <C-d> <Plug>BujoChecknormal
imap <C-d> <Plug>BujoCheckinsert
nnoremap <leader>T :Todo<CR>
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

"** Theming **
colorscheme nord

" Airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

