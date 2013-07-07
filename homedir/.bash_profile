export CHARMAP="UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG=en_GB.UTF-8

export GOROOT=/usr/local/go
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'
export EDITOR=vim

# turn on autocompletion for mac
if [ -x /usr/local/bin/brew ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

# Include basrc after autocompleten, so we can test for certain functions
[[ -s ~/.bashrc ]] && source ~/.bashrc
