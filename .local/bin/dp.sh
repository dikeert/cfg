#!/usr/bin/env sh

function verify_dropbox {
	if ! [ -f "$(which dropbox-cli)" ]; then
		echo "Can't find dropbox-cli"
		exit 3
	fi
}

function get_status {
	echo "$(dropbox-cli status)"
}


function main {
	verify_dropbox
	get_status
}

main "$@"

