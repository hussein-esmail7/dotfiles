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
" Plug 'morhetz/gruvbox'					" Colour theme
Plug 'tomasiser/vim-code-dark'
Plug 'vim-utils/vim-man'
" Plug 'itchyny/lightline.vim'			" Lightline statusline
" Plug 'git@guthub.com:ycm-core/YouCompleteMe.git'
Plug 'dkarter/bullets.vim'				" Bulleted lists
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" =============================================================================
" === General ================================================================
" =============================================================================

syntax on

scriptencoding utf-8
set encoding=utf-8

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noswapfile		" Does not create .swap files in each folder
set smartindent		" Self-explanatory
set exrc			" Source another .vimrc if there is one in current dir
set nu				" Line numbers follow current line
set relativenumber	" Follow current line numbers
set noerrorbells	" Do not play a sound when an error occurs
set incsearch		" Highlight items as they are searched
set scrolloff=5		" If cursor is at the bottom, you see the text after it
set signcolumn=yes	" Used for symbols in displaying error symbols, etc
set linebreak		" New line only on new words, not in the middle of words
set showtabline=2	" Always show tabline
set spelllang=en_ca	" Default language
set cursorline		" Highlight the line the cursor is on
set hlsearch		" Highlight items when searching them

set showcmd			" Show commands in bottom right corner while typing it
set ruler			" Shows the column and row num the cursor is on
set splitright		" Split windows to the right rather than below
set splitbelow		" Split windows to bottom rather then above
set sc
set autoindent		" set autoindent tab on new lines
set copyindent		" copy the previous indentation on autoindenting
set path+=**		" Search recursively in directory
set wildmenu		" Display all matching files when we tab to auto-complete
set undodir=~/.vim/undodir
set undofile		" Store each command so they can be done in individual undo files at undodir
set whichwrap+=>,l	" Line wrapping

set autoread		" Reload files if changed externally
set whichwrap+=<,h	" Line wrapping
set lazyredraw		" redraw only when we need to.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set autowriteall	" When going to edit another document using ":e", save current
set colorcolumn=80	" Default line width
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Show tab indentation lines
set list
set listchars=tab:\|\ ,eol:¬

" Remove trailing whitespaces on save without moving cursor
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * call TrimWhitespace()


" When vimrc is edited, reload it
autocmd bufwritepost .vimrc source %
autocmd bufwritepost vimrc.vim source %

" =============================================================================
" === Colour Theme ===========================================================
" =============================================================================

colorscheme codedark
set background=dark

" Allow transparent background in vim
" https://stackoverflow.com/a/37720708/8100123
" Noticed this only happens for only lines in the file, not whole window
hi Normal guibg=NONE ctermbg=NONE
" EOL character with transparent background
hi NonText guibg=NONE ctermbg=NONE

hi EndOfBuffer guibg=NONE ctermbg=NONE

" =============================================================================
" === Status Line ============================================================
" =============================================================================

set laststatus=2			" Always show status line (0 to disable)
set noshowmode				" Do not show "-- INSERT --" after the status line
set splitright
let g:airline_theme = 'codedark'
let g:airline_section_b="%f %m"
let g:airline_section_c=""
let g:airline_section_y="" " Get rid of encoding type
let g:airline#extensions#whitespace#enabled = 0 " Disable errors on RS of bar

" let g:airline_detect_whitespace=0

" =============================================================================
" === Functions ==============================================================
" =============================================================================

" Go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
\ execute("normal `\"") | endif

" =============================================================================
" === Remaps =================================================================
" =============================================================================

""" Command line maps
" Compiler program: https://github.com/hussein-esmail7/sh/blob/main/c.sh to F5
map <f5> :!~/git/sh/c.sh %<cr><ENTER>
map <f6> :!~/git/sh/openpdf.sh %<cr><ENTER>
map <f7> :setlocal spell! spelllang=en_ca<CR>
""" Normal Mode Shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Make Y yank till end of line
nnoremap Y y$
""" END

" =============================================================================
" === Text Replacements ======================================================
" =============================================================================
""" Replacements: Inline
autocmd FileType tex	inoremap	;b		\textbf{}<Esc>T{i
autocmd FileType tex	inoremap	;i		\textit{}<Esc>T{i
autocmd FileType tex	inoremap	;h		\textit{()}<Esc>T(i
autocmd FileType tex	inoremap	;ul		\underline{}<Esc>T{i
autocmd FileType tex	inoremap	`		`'<Left>
autocmd FileType tex	inoremap	$		$$<Left>
autocmd FileType tex	inoremap	;sec	\section{}<Esc>T{i
autocmd FileType tex	inoremap	;ssec	\subsection{}<Esc>T{i
autocmd FileType tex	inoremap	;sssec	\subsubsection{}<Esc>T{i
autocmd FileType tex	inoremap	;table	\begin{table}[h]<Enter>\begin{tabular}{ll}<Enter>& \\<Enter>&<Enter>\end{tabular}<Enter>\end{table}<Esc>2kT&hi
autocmd FileType tex	inoremap	;ltable	\begin{longtable}{l p{12cm}}<Enter>& \\<Enter>&<Enter>\end{longtable}<Esc>2kT&hi
""" END

""" HTML
autocmd FileType html	inoremap	<		<></><Esc>4hi
autocmd FileType css	inoremap	{		{<Enter><Tab><Enter>}<Esc>k0xA
autocmd FileType css	inoremap	//		/*  */<Esc>2hi
" TODO: Following line does not do anything yet. Maybe vim thinks there's comment?
" autocmd FileType py		inoremap	'''		"""<Enter>"""<Esc>O
""" END

""" C
" New multiline comment
autocmd FileType c	inoremap	///		/*  */<Esc>2hi
""" END

""" Replacements: New lines
" New item on next line in itemize, enumerate, etc.
autocmd FileType tex	inoremap	;;		<CR>\item<Space>
" New environment
autocmd FileType tex	inoremap	;env	\begin{}<Enter>\end{}<Esc>k$i
" New figure environment
autocmd FileType tex	inoremap	;fig	\begin{figure}<Enter>\end{figure}<Esc>k$i
" New itemize environment
autocmd FileType tex	inoremap	;list	\begin{itemize*}<CR>\item <CR>\end{itemize*}<Esc>k$i<Space>
" New enumerate environment
autocmd FileType tex	inoremap	;enum	\begin{enumerate*}<Enter><Enter>\end{enumerate*}<Esc>k$i<Tab>\item<Space>
" New enumalph* custom environment
autocmd FileType tex	inoremap	;elet	\begin{enumalph*}<Enter><Enter>\end{enumalph*}<Esc>k$i<Tab>\item<Space>
" New code environment
autocmd FileType tex	inoremap	;code	\begin{lstlisting}<Enter><Enter>\end{lstlisting}<Esc>k$i<Tab>
" New center environment
autocmd FileType tex	inoremap	;center	\begin{center}<Enter><Enter>\end{center}<Esc>k$i<Tab>
""" END

