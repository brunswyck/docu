" git clone https://github.com/VundleVim/Vundle.vim.git
" ~/.vim/bundle/Vundle.vim
" for more info check
" in vim do :PluginUpdate
" https://github.com/VundleVim/Vundle.vim
" to config on a new git clone
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :echo &rtp
" set rtp+=/home/[YourUserName]/.vim/bundle/Vundle.vim
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

" NERDTree file explorer + git plugin
" https://github.com/scrooloose/nerdtree
" https://github.com/Xuyuanp/nerdtree-git-plugin

" Molokai-dark color scheme for Vim https://github.com/pR0Ps/molokai-dark
Plugin 'pR0Ps/molokai-dark'

Plugin 'scrooloose/nerdtree'
" Crtl+ww cycle though all windows
" Crtl+wh takes you left a window
" Crtl+wj takes you down a window
" Crtl+wk takes you up a window
" Crtl+wl takes you right a window
" t open new tab
" T open new tab while staying in current tab
" gt cycle though all tabs
" gT cycle though all tabs (moves to the left)
"  
"  Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>
" autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" for now I'm just toggling hidden files by pressing uppercase i
" let NERDTreeShowHidden=1
Plugin 'Xuyuanp/nerdtree-git-plugin'
" NERD Commenter
" for more info type :help nerdcommenter

Plugin 'scrooloose/nerdcommenter'

" quick git commands in vim
" https://github.com/tpope/vim-fugitive

Plugin 'tpope/vim-fugitive'

" syntax checker for vim 8 and up
" Asynchronous Lint Engine
Plugin 'w0rp/ale'

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
colorscheme molokai-dark
" for terminal which supports truecolor
set termguicolors
" else set t_Co=256
"
" configure keyboard mappings here
" type Ojj or ojj to quickly insert newline
inoremap jj <ESC> 
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,space:␣
" Quickly go to line number
:nnoremap <CR> G
