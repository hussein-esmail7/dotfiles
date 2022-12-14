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

" See `:h airline-hunks`
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'chrisbra/changesPlugin'
Plug 'tomtom/quickfixsigns_vim'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
" Plug 'neoclide/coc-git'
"
" HUSSEIN'S TEST ITEMIZE RELINE PLUGIN
" 2022 12 12
" Plug '$HOME/Downloads/testitem.vim'

call plug#end()



" =============================================================================
" === General ================================================================
" =============================================================================

syntax on
set bg=light

scriptencoding utf-8
set encoding=utf-8

set tabstop=4		" Number of spaces <Tab> counts for
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
set t_Co=256 " This line is required for color schemes to work on iTerm on Mac

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

" Disable re-indenting open brackets in .tex files
" https://vi.stackexchange.com/a/13752
let g:tex_indent_items=0
" =============================================================================
" === Colour Theme ===========================================================
" =============================================================================

colorscheme codedark
" colorscheme tender
set background=dark

" Allow transparent background in vim
" https://stackoverflow.com/a/37720708/8100123
" Noticed this only happens for only lines in the file, not whole window
hi Normal guibg=NONE ctermbg=NONE
" EOL character with transparent background
hi NonText guibg=NONE ctermbg=NONE

hi EndOfBuffer guibg=NONE ctermbg=NONE

if (has("termguicolors"))
 set termguicolors
endif

" set airline theme
let g:airline_theme = 'tender'

let macvim_skip_colorscheme=1

" =============================================================================
" === Status Line ============================================================
" =============================================================================

set laststatus=2			" Always show status line (0 to disable)
set noshowmode				" Do not show "-- INSERT --" after the status line
set splitright

let g:airline_theme = 'codedark'

" This was on, it would show "SPELL [EN_CA]" beside mode
" let g:airline_detect_spell=0 " Turn off spell detection. Default = 1. If

let g:airline#extensions#whitespace#enabled = 0 " Disable errors on RS of bar

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep='|' " Left separator
let g:airline_right_sep='|' " Right separator
let g:airline_detect_modified=1
let g:airline_symbols.maxlinenr = 'L' " Replacing '☰ '
let g:airline_symbols.linenr = 'L'
let g:airline_symbols.colnr = 'C'
let g:airline_symbols.words = 'W'

" remove separators for empty sections
let g:airline_skip_empty_sections = 1

" =============================================================================
" === Functions ==============================================================
" =============================================================================

" Go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
\ execute("normal `\"") | endif


fu! TextWrap(text, width, indent)
	let l:line = ''
	let l:ret = ''
	for word in split(a:text)
		if strdisplaywidth(l:line) + strdisplaywidth(word) + 1 > a:width
			if strdisplaywidth(l:ret)
				let l:ret .= "\n"
			endif
			let l:ret .= "\t" . l:line
			let l:line = ''
		endif
		if strdisplaywidth(l:line)
			let line .= ' '
		endif
		let l:line .= word
	endfor
	let l:ret .= "\n" . l:line
	exe "normal! o" . l:ret . "\<Esc>"
endfu



" Wrap item lines in LaTeX
function WrapItemLine() 
	" abort at the above line means abortable if the function fails
	let ft = &filetype
	let wi = &colorcolumn
	let indent = 8
	if ft == 'tex'
		if wi != 0
			let wi = 80
		endif
		let line1=getline('.')
		" echom stridx(line, "\\item")
		if stridx(line1, "\\item")
			" echom "tabs: " . count(line1, "\t")
			" If line begins with the item marker, wrap the line
			let l:line = ''
			let l:ret = ''
			for word in split(line)
				if len(l:line) + len(word) + 1 > a:wi
					if len(l:ret)
						let l:ret .= "\n"	
					endif
					let l:ret .= repeat(' ', indent) . l:line
					let l:line = ''
				endif
				if len(l:line)
					let l:line .= ' '
				endif
				let l:line .= word
			endfor
			let l:ret .= "\n" . repeat(' ', indent) . l:line
			return l:ret
		endif
	endif
endfunction







" =============================================================================
" === Remaps =================================================================
" =============================================================================

""" Command line maps
" Compiler program: https://github.com/hussein-esmail7/sh/blob/main/c.sh to F5
map <f5> :!~/git/sh/c.sh -q "%"<cr><ENTER>
map <f6> :!~/git/sh/c.sh -o "%"<cr><ENTER>
map <f7> :setlocal spell! spelllang=en_ca<CR>
""" Normal Mode Shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Make Y yank till end of line
nnoremap Y y$
" Move anything after cursor to next line
nnoremap H i<Enter><Esc>
""" END

" =============================================================================
" === Text Replacements ======================================================
" =============================================================================
""" Replacements: Inline
autocmd FileType tex	inoremap	;b		\textbf{}<Esc>T{i
autocmd FileType tex	inoremap	;i		\textit{}<Esc>T{i
autocmd FileType tex	inoremap	;h		\textit{()}<Esc>T(i
autocmd FileType tex	inoremap	;qr		\begin{center}<Enter>% \usepackage{qrcode}<Enter>\qrcode[hyperlink]{}<Enter>\end{center}<Esc>kf{a
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
"" END

""" Replacements: New lines
" New item on next line in itemize, enumerate, etc.
autocmd FileType tex	inoremap	;;		\item<Space>
" New environment
autocmd FileType tex	inoremap	;env	\begin{}<Enter>\end{}<Esc>k$i
" New figure environment
autocmd FileType tex	inoremap	;fig	\begin{figure}<Enter>\end{figure}<Esc>k$i
" New itemize environment
autocmd FileType tex	inoremap	;list	\begin{itemize*}<CR>\item <CR>\end{itemize*}<Esc>k$i<Space>
" New enumerate environment
autocmd FileType tex	inoremap	;enum	\begin{enumerate*}<CR>\item <CR>\end{enumerate*}<Esc>k$i<Space>
" New enumalph* custom environment (enumitem package required)
autocmd FileType tex	inoremap	;elet	\begin{enumalph*}<CR>\item <CR>\end{enumalph*}<Esc>k$i<Space>
" New code environment (lstlisting package requred)
autocmd FileType tex	inoremap	;code	\begin{lstlisting}<Enter><Enter>\end{lstlisting}<Esc>k$i<Tab>
" New center environment
autocmd FileType tex	inoremap	;center	\begin{center}<Enter><Enter>\end{center}<Esc>k$i<Tab>
" New comment environment (comment package required)
autocmd FileType tex	inoremap	;/	\begin{comment}<Enter><Enter>\end{comment}<Esc>k$i<Tab>
""" END

