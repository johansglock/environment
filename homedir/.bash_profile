export GOROOT=/usr/local/go
export PATH=/usr/local/bin:$PATH
export CLICOLOR=1
export GREP_COLOR=auto
export EDITOR=vim

[[ -s ~/.bashrc ]] && source ~/.bashrc

if [ -x /usr/local/bin/brew ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi
