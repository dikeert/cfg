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
	local root="$(git rev-parse --show-toplevel)"
	local atl_opts="-s ${HOME}/.m2/atl.xml"
	local opts=""
	if [ -f "${root}/.git/config" ]; then
		if [ $(cat "${root}/.git/config" | grep url | grep @ | cut -d '@' -f 2 | cut -d '.' -f 1) = 'stash' ]; then
			opts="${opts} ${atl_opts}"
		fi

		if [ $(cat "${root}/.git/config" | grep url | grep @ | cut -d '@' -f 2 | cut -d ':' -f 1) = 'bbc' ]; then
			opts="${opts} ${atl_opts}"
		fi
	fi

	~/.local/bin/mvn ${opts} $@
}

function prompt_text {
	if [ "$EUID" -eq 0 ]; then
		printf '[***ROOT***] # '
	else
		printf '$ '
	fi
}

function prompt_color {
	if [ "$EUID" -eq 0 ]; then
		printf '\e[31m'
	else
		printf '\033[36m'
	fi

}

alias mvn=do_mvn


complete -C '~/.local/bin/aws_completer' aws
export PS1='\[\033[36m\][$(shorten_path)]\[\e[31m\]$(__git_ps1)\n\[$(prompt_color)\]$(prompt_text)\[\033[m\]'
export LS_COLORS='di=1;34:ln=1;31:so=37:pi=1;93:ex=35:bd=37:cd=37:su=37:sg=37:tw=32:ow=32'

