#                         ▄▀▀    ▀
#   ▄▄▄    ▄▄▄   ▄ ▄▄   ▄▄█▄▄  ▄▄▄     ▄▄▄▄
#  █▀  ▀  █▀ ▀█  █▀  █    █      █    █▀ ▀█
#  █      █   █  █   █    █      █    █   █
#  ▀█▄▄▀  ▀█▄█▀  █   █    █    ▄▄█▄▄  ▀█▄▀█
#                                      ▄  █
#                                       ▀▀

cd ${HOME}
export EDITOR=vim
export BROWSER=/usr/bin/brave       # Default browser to Brave instead of Firefox
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export HOMEBREW_NO_ENV_HINTS=1 # Hide homebrew hints on macOS

export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/X11/bin
export PATH=$PATH:$HOME/.local/bin
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 musikcube # Used to get musikcube to work
export PATH=/usr/texbin:/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/texlive/2025basic/bin/universal-darwin:$PATH


# Setting history to 5000
export HISTFILESIZE=5000
export HISTSIZE=5000
export HISTTIMEFORMAT="[%Y %m %d %I:%M:%S %p] "

export BASH_SILENCE_DEPRECATION_WARNING=1 # Get rid of "The interactive shell is zsh" message


# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Personal Variables used while in Terminal
export SCHOOL="~/Documents/School/1\ Y3W"
export GIT='git'
export CODE='Documents/Coding'
export SITE='/hdd1/Website/husseinesmail'

# Quickly cd into my Python directory
alias py='cd ~/Documents/Coding/py'
alias pyf='cd ~/Documents/Coding/py/Finished'
alias vcp="cd '/home/hussein/Documents/School/VCP/1 2021-22'"
alias s="cd ~/Documents/School"
alias g="cd ~/git"
alias yc="cd ~/git/yorku-class-scraper"

# Compile file program
alias c='${HOME}/${GIT}/sh/c.sh'
alias c2='${HOME}/Downloads/c2.sh'

# Always copy recursively, in case I'm copying a folder
alias cp='cp -r'

# alias g='${HOME}/${GIT}/sh/g.sh'
alias b64='${HOME}/${GIT}/sh/b64.sh' # Base64 converter program
alias bashrc='$EDITOR ${HOME}/${GIT}/dotfiles/bashrc'
alias bulkrename='${HOME}/${GIT}/sh/bulkrename.sh'
alias config='$EDITOR ${HOME}/${GIT}/dotfiles/bashrc'
alias f="fzf --keep-right --prompt='Search: '"
alias gitpush='${HOME}/${GIT}/sh/gitpush.sh'
alias gs="git status"
alias cheat='${HOME}/${GIT}/sh/cheatsheet.sh'
alias ip='${HOME}/${GIT}/sh/ip.sh'
alias ls="ls -1p" # How I like to see `ls`
alias mkv='${HOME}/${CODE}/sh/mkv.sh'
alias music='musikcube'
alias mv='mv -i'
alias news='pkill news ; newsboat -q' # Newsboat & also kill previous instances
alias n='pkill news ; newsboat -q' # Newsboat & also kill previous instances
alias ni='python3 ${HOME}/${GIT}/nindex/nindex.py' # Notebook index program
alias nicefont='toilet -f mono9'						# Nice title text
alias notes='${HOME}/${GIT}/sh/notes.sh' # Program that opens school notes file
alias now='date "+%Y %m %d %H:%M:%S"'
alias pass='${HOME}/${CODE}/sh/pass.sh' # Program that generates a password
alias pdf='${HOME}/${CODE}/sh/pdf.sh'
alias plex='${HOME}/${GIT}/sh/plex.sh' # Program that tells if someone is using this computer to watch a movie via Plex Media Server
alias poly='/home/hussein/.config/polybar/launch.sh' # Launches polybar on Linux
alias rss="cd ~ ; source .venv/bin/activate ; ${HOME}/git/dotfiles/rss.sh ; deactivate"
alias rm='rm -i'
alias school='cd && cd "$HOME/Documents/School - 1 University/1 Y1SU" && open .'
alias server='python3 -m http.server'
alias t='${HOME}/${GIT}/template-maker/template-maker'
alias template='${HOME}/${GIT}/template-maker/template-maker'
alias text='${HOME}/${CODE}/sh/text.sh'
alias update='${HOME}/${GIT}/sh/update.sh'
alias v="vim"											# Editor shortcut
alias vimrc="$EDITOR ~/git/dotfiles/vimrc.vim"	# Open vimrc quickly
alias weather='curl wttr.in/Toronto'
alias wget='wget -crq --show-progress'
alias yt='yt-dlp --no-check-certificate --yes-playlist --embed-subs --embed-subs --write-auto-subs --sub-lang "en.*" -S vcodec:h264,res,acodec:m4a --recode mp4 -o "%(upload_date>%Y)s %(upload_date>%m)s %(upload_date>%d)s %(title)s.%(ext)s"'
alias ytf='yt-dlp --no-check-certificate --yes-playlist --embed-subs --embed-subs --write-auto-subs --sub-lang "en.*" -S vcodec:h264,res,acodec:m4a --recode mp4 -o "%(channel)s/%(upload_date>%Y)s %(upload_date>%m)s %(upload_date>%d)s %(title)s.%(ext)s"'
alias ytq='yt-dlp --quiet --no-check-certificate --yes-playlist --embed-subs --embed-subs --write-auto-subs --sub-lang "en.*" -S vcodec:h264,res,acodec:m4a --recode mp4 -o "%(upload_date>%Y)s %(upload_date>%m)s %(upload_date>%d)s %(title)s.%(ext)s"'
alias yta='${HOME}/${GIT}/sh/yta.sh'
alias ytw='${HOME}/${CODE}/sh/ytw.sh'
alias z='zathura'
alias :q='exit'

function vf() {
	A="$(ls -1 | grep -E '.tex|.md|.txt|.py|.vim|.sh' | fzf)"
	if [ ${#A} -ne 0 ] ; then
		$EDITOR "$A"
	else
		echo -e "[\e[32mERROR\e[0m] No file selected!"
	fi

}
# zoom-vol: When I use Zoom, it randomly lowers my microphone sensitivity.
#	This constantly sets it to 100% (which is what it should stay at)

# Prints ls with directories first, then files. Directories = blue, files = green. Directories are alphabetized, and so are files. Directories have a "/" at the end
# FIX LATER
# function ls() {
#     ls -Flh | sort -r | awk 'NF==9 { if ($1~/^d/) { printf "\033[1;34m" $9 "\033[0m" "\n" } else { printf "\033[1;32m" $9 "\033[0m" "\n" } }'
# }

if [[ "$OSTYPE" == "linux-gnu"* ]]; then # Linux System
    alias todo='$EDITOR ${HOME}/Downloads/todo.txt' # Quickly open my todo list
    alias spot='xdg-open `spot-f` &'
    alias school='xdg-open "${HOME}/${SCHOOL}" &'
    alias y="yay"
    alias p="sudo pacman"
    alias ytfzf="ytfzf -t --preview-side=right"
	alias nurls='$EDITOR ~/.config/newsboat/urls'
	export PATH=$PATH:/usr/local/texlive/2023basic/tlpkg
	export MANPATH=$MANPATH:/usr/local/texlive/2021/texmf-dist/doc/man
	export INFOPATH=$INFOPATH:/usr/local/texlive/2021/texmf-dist/doc/info
elif [[ "$OSTYPE" == "darwin"* ]]; then # macOS System
	export PYTHONPATH=$PYTHONPATH:/System/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages/
    export PATH=$PATH:${HOME}/Library/Python/3.9/bin
    export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.9/bin
    export PATH=$PATH:/Library/TeX/texbin/
    export PATH=$PATH:/Library/TeX/texbin//
    export PATH=$PATH:/usr/local/texlive/2020basic/bin/universal-darwin

	alias todo='open ${HOME}/Downloads/todo.txt' # Quickly open my todo list
    alias spot='open `spot-f`'
    alias text='${HOME}/Documents/Coding/sh/text.sh'
	alias nurls='$EDITOR ~/.newsboat/urls'
fi

## pdftex-quiet configuration {START}
# https://gitlab.com/jirislav/pdftex-quiet/
# alias pdflatex='pdftex-quiet'
## pdftex-quiet configuration {END}


function sitepush() {
	# python3 "${HOME}/${GIT}/html2rss/html2rss.py" "$1"
	# scp -r /hdd1/Website/husseinesmail/ root@husseinesmail.xyz:/var/www/
	rsync -aqz /hdd1/Website/husseinesmail/ root@husseinesmail.xyz:/var/www/husseinesmail/
    folder_name=$(date +"%Y %m %d %H%M")
    # mkdir -p "/hdd1/Website/${folder_name}"
    cp -R /hdd1/Website/husseinesmail/ "/hdd1/Website/${folder_name}/"
}

function mcd() {
    # Create directory and cd to it
    mkdir -p "$1" && cd "$1"
}

function heicr() {
	for i in *.HEIC; do
		tifig -v -p "$i" "${i%'.HEIC'}.jpg"
		rm -f "$i"
	done
}
# The git prompt's git commands are read-only and should not interfere with
# other processes. This environment variable is equivalent to running with `git
# --no-optional-locks`, but falls back gracefully for older versions of git.
# See git(1) for and git-status(1) for a description of that flag.
#
# We wrap in a local function instead of exporting the variable directly in
# order to avoid interfering with manually-run git commands by the user.
function __git_prompt_git() {
  GIT_OPTIONAL_LOCKS=0 command git "$@"
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS
  local -a FLAGS
  FLAGS=('--porcelain')
  if [[ "$(__git_prompt_git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ "${DISABLE_UNTRACKED_FILES_DIRTY:-}" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    case "${GIT_STATUS_IGNORE_SUBMODULES:-}" in
      git)
        # let git decide (this respects per-repo config in .gitmodules)
        ;;
      *)
        # if unset: ignore dirty submodules
        # other values are passed to --ignore-submodules
        FLAGS+="--ignore-submodules=${GIT_STATUS_IGNORE_SUBMODULES:-dirty}"
        ;;
    esac
    STATUS=$(__git_prompt_git status ${FLAGS} 2> /dev/null | tail -1)
  fi
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

function plural() {
    # Used for PS1 (for displaying number of files, and showing "1 file" instead of "1 files")
    # Must be before PS1 declaration
    [ "$(ls -1 | wc -l | sed 's: ::g')" -eq 1 ] || echo "s"
}

function search_history() {
	history | grep $1
}

function bookinfo() {
	# pip install isbntools
	if [ ! -z $1 ] ; then
		isbn_meta $1 tex
	else
		echo "ISBN number required"
	fi
}

# This command allows bashrc shortcuts to be run within the Vim terminal
# https://stackoverflow.com/a/51895549/8100123
shopt -s expand_aliases

# All in green: {username} @ YYYY MM DD HH:mm: {Current dir}
# PS1="\[\e[32m\]\u @ \$(date '+%Y %m %d %I:%M'):\[\e[00m\] \W (\$(ls -1 | wc -l | sed 's: ::g') file\$(plural)) > "

# [{red: username}@{cyan: computer name}: (num of files) {cwd}]
export PS1="[\[\e[31m\]\u\e[00m\]@\e[36m\]\h\e[00m\]: (\$(ls -1 | wc -l | xargs)) \W] "
