#!/bin/bash

USER=$(whoami)
if [ ${USER} == root ]; then
  HOME="/root"
else
  HOME="/home/${USER}"
fi

# Enviromnemt

PS1="\[\033[0;35m\]\u@\h:\w/:$\[\033[0m\] "
umask 022
export EDITOR="vim" VISUAL="gvim"
export PAGER="most"

# pass
export PASSWORD_STORE_DIR="$HOME/.config/password-store/"

# Paths
PATH=/bin:/usr/bin:/usr/games

# do we have a local "bin" dir?
if [ -d "$HOME/bin" ]; then
	PATH="$PATH:$HOME/bin"
fi

# More paths
if [ -d "$HOME/.cargo/bin" ]; then PATH="${PATH}:$HOME/.cargo/bin";fi
if [ -d "/usr/lib64/java/bin" ];then PATH="${PATH}:/usr/lib64/java/bin";fi
if [ -d "/usr/lib64/java/jre/bin" ];then PATH="${PATH}:/usr/lib64/java/jre/bin";fi
if [ -d "$HOME/.composer/vendor/bin" ];then PATH="${PATH}:$HOME/.composer/vendor/bin";fi

# History
# ========
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend

# Aliases and functions

if [ -f "$HOME/.bash_alias" ]; then source "$HOME/.bash_alias";fi
if [ -f "$HOME/.bash_functions" ]; then source "$HOME/.bash_functions";fi
