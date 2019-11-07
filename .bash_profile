#!/usr/bin/env bash

function mkcd() {
	command mkdir "$1" && cd "$1" || return
}
alias artisan="php artisan"
export HISTCONTROL=ignoreboth:erasedups

eval "$(/usr/libexec/path_helper -s)"

export PATH="/Applications/MAMP/bin/php/php7.3.8/bin:$PATH"
export PATH="$PATH:~/.composer/vendor/bin"
export PATH="$PATH:~/spark-installer"

alias ..="cd .."

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export OPENCOLLECTIVE_HIDE=1
export DISABLE_OPENCOLLECTIVE=1
export SUPPRESS_SUPPORT=1
export ADBLOCK=1
export ANSIBLE_NOCOWS=1

export LESS="-R"
export CLICOLOR=1

if [[ "$(uname -s)" == "Darwin" ]]; then
	alias ll="ls -laG"
else
	alias ll="ls -la --color=auto"
fi

extract() {
	if [ -f "$1" ]; then
		case "$1" in
		*.tar.bz2) tar xjf "$1" ;;
		*.tar.gz) tar xzf "$1" ;;
		*.bz2) bunzip2 "$1" ;;
		*.rar) unrar e "$1" ;;
		*.gz) gunzip "$1" ;;
		*.tar) tar xf "$1" ;;
		*.tbz2) tar xjf "$1" ;;
		*.tgz) tar xzf "$1" ;;
		*.zip) unzip "$1" ;;
		*.Z) uncompress "$1" ;;
		*.7z) 7z x "$1" ;;
		*) echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

aws_keys() {
	if [ -f "$1" ]; then
		sed 1d "$1" | while IFS=, read -r aws_username aws_password aws_id aws_secret aws_url; do
			echo "# $aws_username"
			echo "export AWS_ACCESS_KEY_ID=$aws_id"
			echo " export AWS_SECRET_ACCESS_KEY=$aws_secret"
		done
	else
		echo "'$1' is not a valid file"
	fi
}

