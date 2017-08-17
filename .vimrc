" for more info check
" in vim do :PluginUpdate
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

" syntax checker for vim 8 and up
" Asynchronous Lint Engine
Plugin 'w0rp/ale'
" vim-monokai
" https://github.com/crusoexia/vim-monokai
Plugin 'crusoexia/vim-monokai'

" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plugin 'godlygeek/tabular'

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
" set tabstops every 4 spaces and set the shiftwidth (the amount you indent)
" to 2 spaces
set ts=4 sw=2
set number " show current line number
set relativenumber " show relative line numbers
syntax on
colorscheme monokai
" for terminal which supports truecolor
set termguicolors
" else set t_Co=256 
