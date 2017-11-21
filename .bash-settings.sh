#!/bin/bash

case $(uname) in
	Darwin) source $HOME/.bash-mac.sh;;
	Linux) source $HOME/.bash-linux.sh;;
esac

# GO
export GOROOT="${HOME}/.local/go"
export GOPATH="${HOME}/Projects/Go"
export GOBIN="${HOME}/.local/bin"
export PATH="${GOPATH}/bin:${GOROOT}/bin:${PATH}"

# Todo.TXT
source ~/.local/share/completions/todo_completion
complete -F _todo t

# MAVEN, JAVA
export MAVEN_OPTS="-Xmx4096m"

source $HOME/.bash-utils.sh
source $HOME/.bash-aliases.sh

# utilities in .bash-mac and .bash-linux can include wrong git prompts
source $HOME/.git-prompt.sh 


export PATH="${HOME}/.local/bin:${PATH}"

# private stuff
for f in $HOME/.bash-private/*; do
	[[ -f "$f" ]] || continue
	source $f
done
