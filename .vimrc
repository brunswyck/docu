" for more info check
" https://github.com/VundleVim/Vundle.vim
" ---------------------------------------
set nocompatible " turn off defaults required
filetype off     " turn off defaults required
" set runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" vundle begin
" -------------
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Pathogen
" git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox

" Retro groove color scheme for Vim 
Plugin 'morhetz/gruvbox'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" -----------------------------------------
set number " show current line number
set relativenumber " show relative line numbers
" uncomment once plugin installed
colorscheme gruvbox
