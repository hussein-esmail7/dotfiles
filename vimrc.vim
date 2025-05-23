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
"
let $BASH_ENV = "~/.bashrc"

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
set nrformats-=octal " When doing g<Ctrl-a>, treat numbers as base 10 not 8

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
	" 2022 12 14 (Wed)
	" ==== What does this function do? ====
	" When I type in LaTeX, I like list items (starting with '\item') with
	" multiple likes to be indented another level than the first line, so you can
	" clearly see where the next point is as well. This is similar to how I take
	" notes on paper as well so I want my typed notes to reflect that as well.
	" Before I wrote this function, I would run 'gqq' on the line, reindent the
	" second line, run 'J' until the rest of the lines below the second line
	" return to the second line, then run 'gqq' again.
	let l:line = ''
	let l:ret = ''
	" Determining the initial indentation level of the line
	let tabnum = indent('.') " Indentation level measured in characters
	let l:width = a:width - l:tabnum
	" TODO: Replace the a:width argument entirely with &colorcolumn
	" TODO: Issue on 2022 12 05 (Thu) -- When a line would wrap to 2 lines (second line does not "		reach 80 characters), the indentation level of the second line is the same as the
	"		first.
	" TODO: Issue on 2022 12 05 (Thu) -- When a line is smaller than 80 charactesr overall and
	"		does not wrap at all, it removes all indentation level of that line.
	for word in split(a:text)
		if strdisplaywidth(l:line) + strdisplaywidth(word) >= l:width
			if strdisplaywidth(l:ret)
				" if l:ret is not empty
				let l:ret .= "\n"
			endif
			if count(l:ret, "\n") == 0
				" Decrease the new width because it's about to be indented once more. This needs to be done when '\n' == 0 because it's before the next iteration checks for the next line. At that point, the width of that line is set in stone
				let l:width -= a:indent " Decrease the allowed chars for the new indent
				let l:ret .= repeat(" ", tabnum) " Reindent 1st line to the same level as before
			endif
			if count(l:ret, "\n") == 1
				" Increase the indentation by 1 on the second line (when '\n' == 1). Any further lines would follow the same indentation level
				let l:ret .= "\t"
			endif
			let l:ret .= l:line
			let l:line = ''
		endif
		if strdisplaywidth(l:line)
			let line .= ' '
		endif
		let l:line .= word
	endfor
	if len(l:ret)
		let l:ret .= "\n" . l:line " Add the last line
	else
		let l:ret .= l:line " Add the last line
	endif
	" Change the line in the file
	exe "normal! 0C" . l:ret . "\<Esc>"
endfu


" =============================================================================
" === Remaps =================================================================
" =============================================================================

""" Command line maps
" Compiler program: https://github.com/hussein-esmail7/sh/blob/main/c.sh to F5
map <f5> :!~/git/sh/c.sh -q "%:p"<CR><CR>
map <f6> :!~/git/sh/c.sh -o "%:p"<CR><CR>
map <f7> :setlocal spell! spelllang=en_ca<CR>
map <f8> :call TextWrap(getline('.'), 79, 4)<CR>
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
autocmd FileType html	inoremap	;h1		<h1></h1><Esc>4ba
autocmd FileType html	inoremap	;h2		<h2></h2><Esc>4ba
autocmd FileType html	inoremap	;h3		<h3></h3><Esc>4ba
autocmd FileType html	inoremap	;h4		<h4></h4><Esc>4ba
autocmd FileType html	inoremap	;h5		<h5></h5><Esc>4ba
autocmd FileType html	inoremap	;h6		<h6></h6><Esc>4ba
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
" New flushright environment
autocmd FileType tex	inoremap	;r	\begin{flushright}<Enter>\end{flushright}<Esc>O\textit{}<Esc>i
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

