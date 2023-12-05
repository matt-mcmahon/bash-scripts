#!/bin/bash

source $HOME/bash-scripts/posh-git.sh

function my-prompt {
	if [ "$color_prompt" = yes ]; then
		local c0="\[\e[0m\]"
		local c1="\[\e[0;36m\]"
		local c2="\[\e[0;33m\]"
	else
		local c0=
		local c1=
		local c2=
	fi

	local max_width=`tput cols`

	if [[ $0 =~ ^- ]];
		then local shelln=$0
		else local shelln=`basename $0`
	fi

	local user_name='${debian_chroot:+($debian_chroot)}\u@\h'

	local path="${PWD/#$HOME/\~}"
	local path_length=$((${#path}))

	local indent="$c1"
	local COUNTER=0
	while [ $COUNTER -lt ${#shelln} ]; do
		let COUNTER=COUNTER+1
		indent="$indent "
	done

	# lines  │ output
	#	───────┼────────────────────────────────
	# p1     │
	# p1     │
	# p2     │ shell : user@machine:path
	# p3, p4 │       : pre/post-git status
	# p5     │       > user input           \
	# PS2    │       > continuation

	local p1="\n\n"
	local p2="$c1$shelln : $c2$user_name"
	local length=$((${#p2} + path_length + 1))

	if [ $length -lt $max_width ]
		then p2="$p2$c1:$c2$path\n"
	  else p2="$p2\n$c1$indent : $c2$path\n"
	fi

	local p3="$c1$indent : $c2"
	local p4="$c0\n"
	local p5="$c1$indent > $c0"
	export PS2="$c1$indent > $c0"

	__posh_git_ps1 "$p1$p2$p3" "$p4$p5"
}
