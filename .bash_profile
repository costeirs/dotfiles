#!/usr/bin/env bash

# Paths
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
eval "$(/usr/libexec/path_helper -s)"

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Exports
export HISTCONTROL=ignoreboth:erasedups
export OPENCOLLECTIVE_HIDE=1
export DISABLE_OPENCOLLECTIVE=1
export SUPPRESS_SUPPORT=1
export ADBLOCK=1
export ANSIBLE_NOCOWS=1

export LESS="-R"
export CLICOLOR=1

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Aliases
alias ..="cd .."

# Cross-platform `ll` with colors
if [[ "$(uname -s)" == "Darwin" ]]; then
	alias ll="ls -laG"
else
	alias ll="ls -la --color=auto"
fi

# Functions
mkcd() {
	command mkdir -p "$1" && cd "$1" || return
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
