" .vimrc
" :so % sources the current file

set tabstop=4 softtabstop=4

" Self-explanatory
set smartindent 

" Source another .vimrc if another is there in the current directory 
set exrc 

" Line numbers follow current line set relativenumber " Show actual line number on the line you're on 
set nu

" Follow current line numbers
set relativenumber 
" Do not play a sound when an error occurs 
set noerrorbells

" Incremental search: Highlight items as they are searched
set incsearch

set scrolloff=3

" Used for symbols in displaying error symbols, etc
set signcolumn=yes

colorscheme slate

syntax on

set showcmd

" Shows the column and row num the cursor is on
set ruler

" map <Caps_Lock> <ESC>

set splitbelow
set splitright

set sc
set ai " set autoindent tab when going to new line if a tab is required

" Search recursively instead of just in the directory you're in
set path+=**

" Display all matching files when we tab to complete what you are typing
set wildmenu

" Line wrapping
set whichwrap+=>,l
set whichwrap+=<,h

" Customizing statusbar
set laststatus=2			" 0 if you want to disable it
set statusline=				" Reset what is stored there
set statusline+=%F			" File path to current file
set statusline+=
set statusline+=%{&modified?'[+]':''}		" Show '[+]' if modified the file
set statusline+=\ %=		" Everything before this is aligned left, rest right
" set statusline+=' Line '    " Error here
set statusline+=%l			" Line number

















