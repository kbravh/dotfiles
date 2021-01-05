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

call plug#begin(stdpath('data') . '/plugged')
  Plug 'arcticicestudio/nord-vim'
call plug#end()

if plug_install
    PlugInstall --sync
endif
unlet plug_install

colorscheme nord

:syntax enable

" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When this option is enabled, vi will use spaces instead of tabs
set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab
