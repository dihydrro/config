" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
"
"			.vimrc fgiraud / gbuclin
"
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------

set whichwrap=<,>
set nocompatible
set showmode
set showcmd

" -----------------------------------------------------------------------
"				when filetype c
" -----------------------------------------------------------------------

autocmd filetype c imap ( ()<left>
autocmd filetype c imap { {<return>}<up><return>
autocmd filetype c imap [ []<left>
autocmd filetype c imap main<tab> int<tab><tab>main(int ac, char **av<right><return>{

" -----------------------------------------------------------------------
"		line and column + line at the bot (status line)
" -----------------------------------------------------------------------

set number
autocmd InsertEnter * :set relativenumber
autocmd InsertLeave * :set norelativenumber
autocmd InsertLeave * :set number
set ruler
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
set laststatus=2
set statusline=filename:\ \%F\ %y\ %=\ line\ %l\ column\ %c\

" -----------------------------------------------------------------------
"			integration :
"				- mouse
"				- indent
" -----------------------------------------------------------------------

set mouse=a
set autoindent
set smartindent

" -----------------------------------------------------------------------
"				Colors :
"			- default colors
" -----------------------------------------------------------------------

syntax on
