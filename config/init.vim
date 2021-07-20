" Bootstrap vim-plug
let plug_install = 0
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    silent exe '!curl -fL --create-dirs -o ' . autoload_plug_path . 
        \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path

"*** Install plugins ***
call plug#begin(stdpath('data') . '/plugged')
  Plug 'arcticicestudio/nord-vim'
  Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
  Plug 'vim-airline/vim-airline'
  Plug 'mattn/emmet-vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons' "always list last
call plug#end()

" Install all plugins if first time installing vim-plug
if plug_install
    PlugInstall --sync
endif
unlet plug_install

"*** Theming ***
colorscheme nord

" CHADtree
let g:chadtree_settings = {"theme.icon_glyph_set": "devicons","theme.text_colour_set": "nord"}

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

"*** Code Editing ***
"syntax enable

" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When this option is enabled, vi will use spaces instead of tabs
" scrolloff:	    Begins scrolling the window when at the specified distance
"                       from the bottom
" number            Show line numbers
" relativenumber    LIne numbers are relative to current line
set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab
set scrolloff   =8
set number
set relativenumber

"*** Shortcuts ***
nnoremap <C-b> :CHADopen<CR>
nnoremap <C-p> :Files<CR>
