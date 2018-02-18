#!/bin/bash

do_log() {
	local source="${1}"
	local msg="${2}"

	echo "[${source}]: ${msg}"
}

log() {
	local msg="${1}"

	do_log "${FUNCNAME[1]}" "${msg}"
}

ensure_exists() {
	local thing="${1}"

	if [ "x${thing}" = "x" ]; then 
		log "Received empty argument"
		exit 1
	fi

	if [ ! -f "${thing}" ]; then
		log "[file=${thing}] not found!"
		exit 1
	fi
}

get_type() {
	local thing="${1}"
	
	local type=`file -b --mime-type "${thing}"`

	if [ "x${type}" = "x" ]; then
		log "Can't resolve type for [file=${thing}]"
		exit 1
	fi

	echo "${type}"
}

to_clipboard() {
	local thing="${1}"

	ensure_exists "${thing}"

	local type=`get_type "${thing}"`
	log "Received a [file=${thing}] with [type=${type}]"

	xclip -selection clipboard -t "${type}" -i "${thing}"
}

to_clipboard "$@"
