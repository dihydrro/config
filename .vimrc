" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
"
"		by Dihydrro
"
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------

" install pathogen
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on

" start syntastic plugin conf"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_config_file = $HOME."/.dihy_config/.syntastic_c_config"

let mapleader = ","

" disable move the cursor left/right to move to the previous/next line
set whichwrap=<,>
set nocompatible
set showmode
set showcmd
set title

" to save ctrl-s
nnoremap <leader>s :w<return>

" start search will typing
set incsearch
set hlsearch
map <C-C> :nohlsearch<return>
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

nnoremap - ddp
nnoremap + dd<up>P
nnoremap "<space> bi"<esc>ea"<esc>l
nnoremap '<space> bi'<esc>ea'<esc>l
nnoremap <leader>u bveu<esc>
nnoremap <leader>U bveU<esc>
inoremap <c-u> <esc>bveu<esc>
inoremap <c-U> <esc>bveU<esc>

inoremap kj <esc>
inoremap ( ()<left>
inoremap { {<return>}<esc>O
inoremap [ []<left>
inoremap ' ''<esc>i
inoremap " ""<esc>i

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
autocmd filetype python :nnoremap <leader>c I#<space><esc>

" c autocompletion
autocmd filetype c :imap main<tab> int<tab><tab>main(int ac, char **av<esc>o{
autocmd filetype c :inoremap ret<tab> return<space>();<left><left>

" html map
autocmd filetype html :inoremap { {}<left>
autocmd filetype html :inoremap < <><left>

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
syntax on

set autoindent
set smartindent

" ===================== UNDO FILE =====================

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
