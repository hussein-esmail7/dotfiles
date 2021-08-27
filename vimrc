"
"                  ▀                        
"         ▄   ▄  ▄▄▄    ▄▄▄▄▄   ▄ ▄▄   ▄▄▄  
"         ▀▄ ▄▀    █    █ █ █   █▀  ▀ █▀  ▀ 
"          █▄█     █    █ █ █   █     █     
"    █      █    ▄▄█▄▄  █ █ █   █     ▀█▄▄▀ 
"
" :so % sources the current file

" =============================================================================
" === Plugins ================================================================
" =============================================================================

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'					" Colour theme
Plug 'vim-utils/vim-man'	
Plug 'itchyny/lightline.vim'			" Lightline statusline
" Plug 'git@guthub.com:ycm-core/YouCompleteMe.git'
Plug 'dkarter/bullets.vim'				" Bulleted lists
call plug#end()

" =============================================================================
" === General ================================================================
" =============================================================================

syntax on

set tabstop=4 
set softtabstop=4
set shiftwidth=4
set noswapfile		" Makes things nicer in each folder, does not create .swap files
set smartindent		" Self-explanatory
set exrc			" Source another .vimrc if another is there in the current directory 
set nu				" Line numbers follow current line 
set relativenumber	" Follow current line numbers
set noerrorbells	" Do not play a sound when an error occurs 
set incsearch		" Highlight items as they are searched
set scrolloff=3		" If cursor is at the bottom, you see the text after it
set signcolumn=yes	" Used for symbols in displaying error symbols, etc
set linebreak		" New line only on new words, not in the middle of words
set showtabline=2	" Always show tabline
set spelllang=en_ca	" Default language
set cursorline		" Highlight the line the cursor is on

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

set colorcolumn=80	" Default line width
highlight ColorColumn ctermbg=0 guibg=lightgrey
" map <Caps_Lock> <ESC>

" Show tab indentation lines
set list
set listchars=tab:\|\ ,eol:¬

" =============================================================================
" === Colour Theme ===========================================================
" =============================================================================

colorscheme gruvbox
set background=dark

" =============================================================================
" === Status Line ============================================================
" =============================================================================

let g:currentmode={
      \ 'n'  : 'Normal ',
      \ 'no' : 'N·Operator Pending ',
      \ 'v'  : 'Visual ',
      \ 'V'  : 'V·Line ',
      \ 'x22' : 'V·Block ',
      \ 's'  : 'Select ',
      \ 'S'  : 'S·Line ',
      \ 'x19' : 'S·Block ',
      \ 'i'  : 'Insert ',
      \ 'R'  : 'R ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!'  : 'Shell ',
      \ 't'  : 'Terminal '
      \}

set laststatus=2			" Always show status line (0 to disable)
set statusline=				" Reset what is stored there
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%F			" File path to current file
set statusline+=

set statusline+=\ %{&modified?'[+]':''}		" Show '[+]' if modified the file
set statusline+=\ %=			" Align above left, rest right
set statusline+=\ %p%%			" Percentage of the file the cursor is at
set statusline+=\ %l:%c			" Line:Column

" The lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }


set splitright

" =============================================================================
" === Functions ==============================================================
" =============================================================================

" Go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
        \ execute("normal `\"") |
    \ endif

" =============================================================================
" === Remaps =================================================================
" =============================================================================


""" Normal Mode Shortcuts
nnoremap <Enter> i<Enter><Esc>
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
""" END

" =============================================================================
" === Text Replacements ======================================================
" =============================================================================
""" Replacements: Inline
inoremap < <><Left>
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
autocmd FileType tex inoremap ;b \textbf{}<Esc>T{i
autocmd FileType tex inoremap ` `'<Left>
autocmd FileType tex inoremap $ $$<Left>
autocmd FileType html inoremap < <></><Left><Left><Left><Left>
""" END

""" Replacements: New lines
autocmd FileType tex inoremap ;list \begin{itemize*}<Enter><Enter>\end{itemize*}<Esc>k$i<Tab>\item<Space>
autocmd FileType tex inoremap ;enum \begin{enumerate*}<Enter><Enter>\end{enumerate*}<Esc>k$i<Tab>\item<Space>
autocmd FileType tex inoremap ;code \begin{lstlisting}<Enter><Enter>\end{lstlisting}<Esc>k$i<Tab>
""" END
