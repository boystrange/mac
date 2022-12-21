# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

##########
# PROMPT #
##########

promptcolor=$(tput setaf 2)
bold=$(tput bold)
reset=$(tput sgr0)
export PS1="[\[$promptcolor\]\u@\h\[$reset\]:\W] "

#########################
# ENVIRONMENT VARIABLES #
#########################

export LANG=en_US.UTF-8
export EDITOR=vim
export PATH=~/.local/bin:$PATH
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
export PATH=/usr/local/opt/openjdk/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules

# Disable annoying message (in Catalina) warning about the
# deprecated Bash shell
export BASH_SILENCE_DEPRECATION_WARNING=1

###########
# ALIASES #
###########

alias ls='ls --color'
alias ll='ls -l'

#######
# GIT #
#######

# per i reposotory GIT con certificato scaduto
export GIT_SSL_NO_VERIFY=true

function status {
    git status $1
}

function load {
    git pull -v $1
}

function push {
    git push -v
}

function sync {
    load && save
}

function commit {
    if [ -z "$*" ]; then
	message="snapshot"
    else
	message="$*"
    fi
    git commit -a -m "$message"
}

function save {
    commit "$*" && push
}

function up {
    echo "### Updating homebrew formulae ###"
    brew upgrade
    brew upgrade --cask
}

