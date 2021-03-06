" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
"  by Dihydrro ----------------------------------------------------------
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------

" comment this line to enable vim-markdown-composer
let g:pathogen_blacklist = ['vim-markdown-composer']

" install pathogen
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on

" If you are using vim you may need this to use <M-...>"
if stridx($VIM, '/vim') != -1
  set <M-p>=p
  set <M-h>=h
  set <M-j>=j
  set <M-k>=k
  set <M-l>=l
  set <M-\>=\
  set <M-H>=H
  set <M-J>=J
  set <M-K>=K
  set <M-L>=L
  set <M-v>=v
  set <M-V>=V
  set <M-q>=q
  set <M-=>==
  set <M-w>=w
  set <M-c>=c
  set <M-u>=u
  set <M-U>=U
  set <M-n>=n
  set <M-b>=b
endif

" config ctrlp
let g:ctrlp_map = "<m-p>"
let g:ctrlp_cmd = "CtrlP"
let g:ctrlp_working_path_mode = "wra"
set wildignore=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*

" config typescript-vim
let g:typescript_compiler_binary = ""
let g:typescript_compiler_options = ""

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3
let g:syntastic_typescript_checkers = ["tslint"]
let g:syntastic_javascript_checkers = ["tslint"]

" config tmux
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2
nnoremap <M-h> :TmuxNavigateLeft<return>
nnoremap <M-j> :TmuxNavigateDown<return>
nnoremap <M-k> :TmuxNavigateUp<return>
nnoremap <M-l> :TmuxNavigateRight<return>
nnoremap <M-\> :TmuxNavigatePrevious<return>

nnoremap <M-v> :vsplit<return>
nnoremap <M-V> :split<return>
nnoremap <M-q> :q<return>
nnoremap <M-H> :TmuxResizeLeft<return>
nnoremap <M-J> :TmuxResizeDown<return>
nnoremap <M-K> :TmuxResizeUp<return>
nnoremap <M-L> :TmuxResizeRight<return>
nnoremap <M-=> <C-w>=


let mapleader = ","

" disable move the cursor left/right to move to the previous/next line
set whichwrap=<,>
set nocompatible
set showmode
set showcmd
set title

" to save ctrl-s
nnoremap <M-w> :w<return>
inoremap <M-w> <esc>:w<return>

" start search will typing
set incsearch
set hlsearch
map <M-c> :nohlsearch<return>
set smartcase

" use <TAB> invoke completion in command line
set wildmenu

" the line is cut if to big for the screen
set wrap

" deal with tabulation for most file
set shiftwidth=2
set shiftround
set tabstop=2
set expandtab
set smarttab

set foldmethod=indent

" copy/paste from/to vim/clipboard
set clipboard=unnamedplus

nnoremap - ddp
nnoremap + dd<up>P
nnoremap "<space> wi"<esc>bi"<esc>l
nnoremap '<space> wi'<esc>bi'<esc>l
nnoremap [<space> wi]<esc>bi[<esc>l
nnoremap <M-u> wbveu<esc>
nnoremap <M-U> wbveU<esc>

" next/prev completion binding
inoremap <M-n> <C-n>
inoremap <M-b> <C-p>

" make the current word lower or upper case
inoremap <M-u> <esc>lwbveu<esc>
inoremap <M-U> <esc>lwbveU<esc>

inoremap kj <esc>
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap ' ''<left>
inoremap " ""<left>

" autocompletion
imap iff<tab> if<space>(
imap el<tab> else<space>(
imap eli<tab> else<space>if<space>(
imap whi<tab> while<space>(

" comment completion
autocmd filetype c :nnoremap <leader>c I/*<space><esc>$a<space>*/<esc>
autocmd filetype html :nnoremap <leader>c I<!--<esc>$a--><esc>
autocmd filetype css :nnoremap <leader>c I/*<space><esc>$a*/<esc>
autocmd filetype javascript :nnoremap <leader>c I/*<space><esc>$a*/<esc>
autocmd filetype typescript :nnoremap <leader>c I/*<space><esc>$a*/<esc>
autocmd filetype python :nnoremap <leader>c I#<space><esc>

" c autocompletion
autocmd filetype c :inoremap { {<return>}<esc>O
autocmd filetype c :imap main<tab> int<tab><tab>main(int ac, char **av<esc>o{
autocmd filetype c :inoremap ret<tab> return<space>();<left><left>

" deal with tabulation for c file
autocmd filetype c :set shiftwidth=4
autocmd filetype c :set tabstop=4
autocmd filetype c :set noexpandtab

autocmd BufRead * normal zR
autocmd BufWritePre,BufRead *.[html|css|c|ts|js] normal gg=G

autocmd filetype [html|javascript] :setlocal nowrap

set number
" set relativenumber in insert mode and norelativenumber for other
autocmd InsertEnter * :set relativenumber
autocmd InsertLeave * :set norelativenumber
autocmd InsertLeave * :set number

set ruler
set cursorline
set laststatus=2
set statusline=filename:\ \%F\ %y\ %=\ line\ %l/%L\ column\ %c
colorscheme antares
syntax on

set autoindent
set smartindent

" ===================== UNDO FILE =====================

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
