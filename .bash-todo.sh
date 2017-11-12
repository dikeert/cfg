#!/bin/bash

todo="todo.sh"

function gpc {
	todo.sh lsprj | wc -l
}

function gcc {
	todo.sh lsc | wc -l
}

function gtc {
	todo.sh ls | grep TODO: | cut -d ' ' -f 2
}

function todo_line {
	local line=""
	local projects="[$(gpc) projects]"
	local contexts="[$(gcc) contexts]" 
	local tasks="[$(gtc) tasks]"

	printf "\033[0;34m${projects}\033[0;32m${contexts}\033[0;31m${tasks}"
}

alias t="${todo}"
alias l="${todo} ls"
alias p="${todo} lsprj"
alias c="${todo} lsc"
alias a="${todo} a"
alias do="${todo} do"
alias cc="clear"

source ~/.local/share/completions/todo_completion
complete -F _todo t

export PS1='\[\033[36m\][TODO]$(todo_line)\n\[\033[36m\]✓✓✓ \[\033[m\]'

clear
