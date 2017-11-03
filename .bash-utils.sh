#!/bin/bash

function shorten_path {
        local current_path=`pwd`
        local last=`echo $current_path | sed -e 's/[^\/]*\///g'`
        local path=""
        [[ $current_path == "$HOME"* ]] && read -ra path <<< "~"
        
        current_path=${current_path/"$HOME"/''}
        current_path=${current_path:1}
        
        IFS="/" read -ra current_path <<< "$current_path"
        for x in "${current_path[@]}"
        do
                if [ "$x" == "$last" ];
                then
                        path="${path}/${x}"
                else
                        path="${path}/${x:0:1}"
                fi
        done
        
        echo $path
}


function uber_download {
	lftp -e "pget -c -n128 \"$1\"; quit"
}


function rmd () {
    pandoc -s -f markdown -t man $1 | groff -T utf8 -man | less
}
