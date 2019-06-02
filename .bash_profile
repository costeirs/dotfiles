#!/usr/bin/env bash

function mkcd() {
	command mkdir "$1" && cd "$1" || return
}
alias artisan="php artisan"
export HISTCONTROL=ignoreboth:erasedups

export ANSIBLE_NOCOWS=1
eval "$(/usr/libexec/path_helper -s)"

export PATH="/Applications/MAMP/bin/php/php7.2.14/bin:$PATH"
export PATH="$PATH:~/.composer/vendor/bin"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$PATH:~/spark-installer"

alias ..="cd .."

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export OPENCOLLECTIVE_HIDE=1
export LESS="-R"

ll() {
	if [[ "$(uname -s)" == Darwin ]]; then
		ls -laG
	else
		ls -la --color=auto
	fi
}

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
