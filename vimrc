set nocompatible
filetype off

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

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
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
Plugin 'tpope/vim-dispatch'
"Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'wakatime/vim-wakatime'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
let g:agprg="ag --column --ignore *.min.js --ignore *.js.map --ignore *.min.css.map"

Plugin 'jiangmiao/auto-pairs'
Plugin 'valloric/MatchTagAlways'
Plugin 'rizzatti/dash.vim'
Plugin 'Shougo/neocomplete'
let g:neocomplete#enable_at_startup=1

Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

"Plugin 'Valloric/YouCompleteMe'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

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
set cursorline
set number
set relativenumber
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
let mapleader = " "
map <Leader>t :tabnew<Return>
map <Leader>tn :tabnext<CR>
map <Leader>tp :tabprev<CR>
map <Leader>e :NERDTreeFind<Return>
map <Leader><Space> :nohlsearch<Return>
map <Leader>b :CtrlPBuffer<Return>
nmap <Leader>w :bp<bar>bd #<CR>

" neocomplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
"inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Dash search
nmap <silent> <Leader>d <Plug>DashSearch

" Moving around splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

imap jk <Esc>
imap jj <Esc>
