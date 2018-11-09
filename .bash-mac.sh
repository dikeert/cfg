#!/bin/bash

function do_ppwd {
	pwd | pbcopy
}

function do_idea {
    open -a "`ls -1d /Applications/IntelliJ\ * | tail -n1`" "$1"
}

function do_title {
    echo -ne "\033]0;"$*"\007"
}

function do_tmux {
	if [[ $# -eq 0 ]]; then
		tmux new-session -s "reattach-to-user-namespace -l bash"
	else
		tmux $@
	fi
}

export PS1='\[\033[36m\][$(shorten_path)]\[\e[31m\]$(__git_ps1)\n\[\033[36m\]$ \[\033[m\]'

export CLICOLOR=1
export LSCOLORS=ExBxhxDxfxhxhxhxhxcxcx

function shell_session_update() { :; }

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

