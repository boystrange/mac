###################
# BASIC VARIABLES #
###################

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export PROMPT="[%F{green}%n@%m%f:%~] "
export EDITOR=vim
export LANG=en_US.UTF-8

########
# PATH #
########

export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
export PATH=/usr/local/opt/ruby@2.5/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.5.0/bin/:$PATH
export PATH=~/Library/Haskell/bin:$PATH

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

function sync {
    git pull
    git push
}

function commit {
    if [ -z "$1" ]; then
	message="snapshot"
    else
	message=$1
    fi
    git commit -a -m "$message"
}

function save {
    commit $1 && git push -v
}
