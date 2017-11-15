#!/bin/bash

todo="todo.sh"

function gpc {
	todo.sh lsprj | wc -l | sed -e 's/^[ \t]*//'
}

function gcc {
	todo.sh lsc | wc -l | sed -e 's/^[ \t]*//'
}

function gtc {
	todo.sh ls | grep TODO: | cut -d ' ' -f 2 | sed -e 's/^[ \t]*//'
}

function todo_line {
	local line=""
	local projects="[$(gpc) projects]"
	local contexts="[$(gcc) contexts]" 
	local tasks="[$(gtc) tasks]"

	printf "\033[0;34m${projects}\033[0;32m${contexts}\033[0;31m${tasks}"
}

function do_t {
	if [ "x$1" = "x" ]; then
		do_ls
	elif [ "${1:0:1}" = '+' ]; then
		do_ls "${1}"
	elif [ "${1:0:1}" = '@' ]; then
		do_ls "${1}"
	else
		clear && ${todo} $@ | less -R
	fi
}

function do_ls {
	clear && ${todo} ls $@ | less -R
}


function do_lsprj {
	clear && ${todo} lsprj $@ | less -R
}


alias t="do_t"
alias l="do_ls"
alias p="do_lsprj"
alias c="${todo} lsc"
alias a="${todo} a"
alias do="${todo} do"
alias cc="clear"

source ~/.local/share/completions/todo_completion
complete -F _todo t

export PS1='\[\033[36m\][TODO]$(todo_line)\n\[\033[36m\]✓✓✓ \[\033[m\]'

clear
