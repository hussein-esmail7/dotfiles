#!/bin/bash



# When making a change to this file, run 'source PATH' in terminal to update it after saving this file

EDITOR=/usr/bin/nano # Default editor to nano instead of vim
export EDITOR
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:$HOME/Library/Python/3.9/bin:/Library/Frameworks/Python.framework/Versions/3.8/bin:/Library/TeX/texbin/:/Library/Frameworks/Python.framework/Versions/3.9/bin:/Library/TeX/texbin//:/usr/local/texlive/2020basic/bin/universal-darwin
export PYTHONPATH=$PYTHONPATH:/System/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages/
export PYTHONPATH=$PYTHONPATH:~/test/site-packages
export BASH_SILENCE_DEPRECATION_WARNING=1 # Get rid of "The interactive shell is zsh" message



alias help='python3 ~/help.py'

# Quickly cd into my Python directory
alias py='cd ~/Documents/Coding/py'
alias pyf='cd ~/Documents/Coding/py/Finished'

# Quickly open my todo list
alias todo='open ~/Downloads/todo.txt'

# Compile file program
alias c='~Documents/Coding/sh/c.sh'

# Always copy recursively, in case I'm copying a folder
alias cp='cp -r' 

alias yt='youtube-dl -ic -R 100 --no-check-certificate --yes-playlist --skip-unavailable-fragments --restrict-filenames --sub-lang en --no-warnings --embed-subs --no-part -f best  -o "%(title)s.%(ext)s"'
alias yta=~/Documents/Coding/sh/yta.sh
alias wget='wget --continue --show-progress'
alias ip='echo -n "Local IP: \n" && ipconfig getifaddr en0 && echo -n "External IP: \n" && curl ipinfo.io/ip && echo'
alias music='musikcube'
alias config='open -a TextEdit.app ~/.config/terminal/config'
alias ls='ls -1'
alias now='date +"%Y %m %d"'
alias weather='curl wttr.in/Toronto'
alias server='python3 -m http.server'
alias school='cd && cd "$HOME/Documents/School - 1 University/1 Y1SU" && open .'
alias pdf='$HOME/Documents/Coding/sh/pdf.sh'
alias update='$HOME/Documents/Coding/sh/update.sh'
alias groff-template='$HOME/Documents/Coding/sh/groff-template.sh'
alias groff-cheetsheet='$HOME/Documents/Coding/sh/groff-cheetsheet.sh'
alias b64='$HOME/Documents/Coding/sh/b64.sh'
alias pass='$HOME/Documents/Coding/sh/pass.sh'
alias template='$HOME/Documents/Coding/sh/template.sh'
alias text='$HOME/Documents/Coding/sh/text.sh'
alias newsboat='newsboat -q'
alias news='newsboat'
alias feed='newsboat'
alias ytw='$HOME/Documents/Coding/sh/ytw.sh'

# Prints ls with directories first, then files. Directories = blue, files = green. Directories are alphabetized, and so are files. Directories have a "/" at the end
function ls() {
    ls -Flh | sort -r | awk 'NF==9 { if ($1~/^d/) { printf "\033[1;34m" $9 "\033[0m" "\n" } else { printf "\033[1;32m" $9 "\033[0m" "\n" } }'
}

function mcd() {
    # Create directory and cd to it
    mkdir -p "$1" && cd "$1"
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
    [ "$(ls -1 | wc -l | sed 's: ::g')" -eq 1 ] || echo "s"
}

PS1="\[\e[32m\]\u @ \$(date '+%Y %m %d %I:%M'):\[\e[00m\] \W (\$(ls -1 | wc -l | sed 's: ::g') file\$(plural)) > "

