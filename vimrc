" .vimrc
" :so % sources the current file

syntax on

set tabstop=4 
set softtabstop=4
set shiftwidth=4
set noswapfile		" Makes things nicer in each folder, does not create .swap files
set smartindent		" Self-explanatory
set exrc			" Source another .vimrc if another is there in the current directory 
set nu				" Line numbers follow current line set relativenumber " Show actual line number on the line you're on 
set relativenumber	" Follow current line numbers
set noerrorbells	" Do not play a sound when an error occurs 
set incsearch		" Highlight items as they are searched
set scrolloff=3
set signcolumn=yes	" Used for symbols in displaying error symbols, etc
set linebreak		" New line only on new words, not in the middle of words
set showcmd
set ruler			" Shows the column and row num the cursor is on
set splitbelow
set splitright
set sc
set ai				" set autoindent tab when going to new line if a tab is required
set path+=**		" Search recursively instead of just in the directory you're in
set wildmenu		" Display all matching files when we tab to complete what you are typing
set undodir=~/.vim/undodir
set undofile		" Store each command so they can be done in individual undo files at undodir
set whichwrap+=>,l	" Line wrapping
set whichwrap+=<,h	" Line wrapping

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" map <Caps_Lock> <ESC>

" Customizing statusbar
set laststatus=2			" 0 if you want to disable it
set statusline=				" Reset what is stored there
set statusline+=%F			" File path to current file
set statusline+=
set statusline+=%{&modified?'[+]':''}		" Show '[+]' if modified the file
set statusline+=\ %=		" Everything before this is aligned left, rest right
" set statusline+=' Line '    " Error here
set statusline+=%l			" Line number

" 'morhetz/gruvbox': Colour scheme
" 'dkarter/bullets.vim': Bulleted lists

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-utils/vim-man'
" Plug 'git@guthub.com:ycm-core/YouCompleteMe.git'
Plug 'mbbill/undotree'
Plug 'dkarter/bullets.vim'		

call plug#end()

colorscheme gruvbox
set background=dark









