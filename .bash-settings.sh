#!/bin/bash

case $(uname) in
	Darwin) source $HOME/.bash-mac.sh;;
	Linux) source $HOME/.bash-linux.sh;;
esac

# GO
export GOPATH="$HOME/Projects/Go"
export PATH="$GOPATH/bin:$PATH"

# MAVEN, JAVA
export MAVEN_OPTS="-Xmx4096m"

source $HOME/.bash-utils.sh
source $HOME/.bash-aliases.sh

# utilities in .bash-mac and .bash-linux can include wrong git prompts
source $HOME/.git-prompt.sh 

# private stuff
for f in $HOME/.bash-private/*; do
	[[ -f "$f" ]] || continue
	source $f
done
