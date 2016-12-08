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

"Plugin 'scrooloose/nerdtree'
"let NERDTreeQuitOnOpen = 1

"Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
let g:syntastic_html_tidy_ignore_errors=[
  \" proprietary attribute \"ng-",
  \"trimming empty <i>",
  \"trimming empty <span>",
  \"unescaped & which should be written as &amp;"
\]
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_javascript_checkers = ['eslint']

Plugin 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
Plugin 'vim-airline/vim-airline-themes'

" Plugin 'godlygeek/csapprox'
Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kana/vim-operator-user'
"Plugin 'tpope/vim-vinegar'
Plugin 'jeetsukumaran/vim-filebeagle'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'pangloss/vim-javascript'
Plugin 'wakatime/vim-wakatime'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
cnoreabbrev Ack Ack!
if executable('ag')
  let g:ackprg = 'ag -i --column --ignore "*.min.js" --ignore "*.js.map" --ignore "*.min.css.map" --ignore "*.pdf"'
  cnoreabbrev ag Ack!
  cnoreabbrev aG Ack!
  cnoreabbrev Ag Ack!
  cnoreabbrev AG Ack!
endif

Plugin 'jiangmiao/auto-pairs'
Plugin 'valloric/MatchTagAlways'
Plugin 'romainl/vim-qf'
Plugin 'wellle/targets.vim'
Plugin 'posva/vim-vue'
Plugin 'sheerun/vim-polyglot'
"Plugin 'Shougo/neocomplete'
"let g:neocomplete#enable_at_startup=1

"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'

Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
set completeopt=longest,menuone

Plugin 'shawncplus/phpcomplete.vim'
Plugin 'easymotion/vim-easymotion'

" Track the engine.
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Themes
Plugin 'jacoborus/tender'
Plugin 'trevordmiller/nova-vim'

call vundle#end()
filetype plugin indent on

syntax enable
set background=dark
set termguicolors
colorscheme base16-default-dark

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
nmap <Leader>fw :Ag <C-R><C-W><CR>
nmap <Leader>cc :Dispatch drush cc all<Return>

" neocomplete
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
"inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" operator-surround
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" Moving around splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

imap jk <Esc>
imap jj <Esc>

"--------- Auto-Commands ---------------
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC 
augroup END

augroup PHP
  autocmd!
  autocmd FileType php setlocal iskeyword-=$
augroup END
