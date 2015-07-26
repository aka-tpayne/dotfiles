set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
  \ --ignore .git
  \ --ignore .svn
  \ --ignore .hg
  \ --ignore .DS_Store
  \ --ignore "**/*.pyc"
  \ --ignore tags
  \ -g ""'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
let g:syntastic_html_tidy_ignore_errors=[
  \" proprietary attribute \"ng-",
  \"trimming empty <i>",
  \"trimming empty <span>",
  \"unescaped & which should be written as &amp;"
\]

Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1

Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'wakatime/vim-wakatime'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
let g:agprg="ag --column --ignore *.min.js --ignore *.js.map"
Plugin 'jiangmiao/auto-pairs'

call vundle#end()
filetype plugin indent on

syntax enable
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" General
set laststatus=2
set hidden
set noswapfile
set number
set backspace=indent,eol,start
set so=7
set tags=./tags,tags;$HOME

" Change directory locations
set backupdir=~/.vim/backup-files//
set directory=~/.vim/swap-files//
set undodir=~/.vim/undo-files//

" indents
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set nocindent
set expandtab

" Searching
set incsearch
set hlsearch

" Key mappings
let mapleader = ","
map <Leader>t :tabnew<Return>
map <Leader>e :NERDTree<Return>
map <Leader>E :NERDTree %<Return>
map <Leader><Space> :nohlsearch<Return>
map <Leader>b :CtrlPBuffer<Return>

" Moving around splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

imap jk <Esc>
imap jj <Esc>
