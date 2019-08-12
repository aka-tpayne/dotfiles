set nocompatible
filetype off

set t_RV=

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
  \ --ignore .git
  \ --ignore .svn
  \ --ignore .hg
  \ --ignore .DS_Store
  \ --ignore "**/*.pyc"
  \ --ignore tags
  \ -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_cmd="CtrlP :pwd"

Plugin 'w0rp/ale'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'

Plugin 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
Plugin 'vim-airline/vim-airline-themes'

Plugin 'chriskempson/base16-vim'
Plugin 'jeetsukumaran/vim-filebeagle'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'wakatime/vim-wakatime'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-grepper'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'valloric/MatchTagAlways'
Plugin 'romainl/vim-qf'
let g:qf_mapping_ack_style = 1
" Plugin 'wellle/targets.vim'
" Plugin 'othree/html5.vim'
Plugin 'posva/vim-vue'
" Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'

Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
set completeopt=longest,menuone

Plugin 'shawncplus/phpcomplete.vim'

call vundle#end()
filetype plugin indent on

syntax enable
set background=dark
set termguicolors
colorscheme base16-default-dark
let g:airline_theme = "base16"

" General
set laststatus=2
set hidden
set noswapfile
set cursorline
set number
" set relativenumber
set backspace=indent,eol,start
set so=7
set tags=./tags,tags;$HOME

" Change terminal title to current document name
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)

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
let mapleader = " "
map <Leader>t :tabnew<Return>
map <Leader>tn :tabnext<CR>
map <Leader>tp :tabprev<CR>
map <Leader>e :NERDTreeFind<Return>
map <Leader><Space> :nohlsearch<Return>
map <Leader>b :CtrlPBuffer<Return>
nmap <silent> <Leader>w :bp<bar>sp<bar>bn<bar>bd<CR>
nmap <Leader>gs :Gstatus<Return>
nmap <Leader>gp :Gpush<Return>
nmap <Leader>ev :e ~/.vimrc<Return>
nmap <Leader>ag :Grepper<CR>
nmap <Leader>fw :Grepper -cword -noprompt<CR>
nmap <Leader>cc :Dispatch drush cc all<Return>

" Moving around splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

imap jk <Esc>
imap jj <Esc>

" Add custom commands
command! Code execute "Dispatch code %"

"--------- Auto-Commands ---------------
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC 
augroup END

augroup PHP
  autocmd!
  autocmd FileType php setlocal iskeyword-=$
augroup END

