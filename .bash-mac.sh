#!/bin/bash

function do_ppwd {
	pwd | pbcopy
}

function do_idea {
	/usr/local/bin/idea $@
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

do_j11() {
	export JAVA_HOME=$(/usr/libexec/java_home -v 11)
}

do_j8() {
	export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
}

export PS1='\[\033[36m\][$(shorten_path)]\[\e[31m\]$(__git_ps1)\n\[\033[36m\]$ \[\033[m\]'

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

function shell_session_update() { :; }

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

