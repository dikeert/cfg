# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

function do_ppwd {
	pwd | xclip -selection clipboard
}

function do_idea {
	/usr/local/bin/idea
}

function do_title {
	echo "Not implemented on linux yet"
}

function do_tmux {
    tmux $@
}

function do_mvn {
	local root=$(git rev-parse --show-toplevel)
	if [ $(cat "${root}/.git/config" | grep url | cut -d '@' -f 2 | cut -d '.' -f 1) = 'stash' ]; then
		~/.local/bin/mvn -s ~/.m2/atl.xml $@
	else
		~/.local/bin/mvn
	fi
}

alias mvn=do_mvn

export PS1='\[\033[36m\][$(shorten_path)]\[\e[31m\]$(__git_ps1)\n\[\033[36m\]$ \[\033[m\]'
