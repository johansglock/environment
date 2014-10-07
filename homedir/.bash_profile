# Include our global environment first
[ -f ~/.profile ] && . ~/.profile

# FreeBSD Specific: Auto completion
if [ -f /usr/local/share/git-core/contrib/completion/git-completion.bash ]; then
    . /usr/local/share/git-core/contrib/completion/git-completion.bash
fi
if [ -f /usr/local/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/local/share/git-core/contrib/completion/git-prompt.sh
fi

# Mac OSX Specific: Auto completion
if [ -x /usr/local/bin/brew ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# include git branch if we can get it
if [ "`type -t __git_ps1`" = 'function' ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[0;31m\]$(__git_ps1)\[\033[00m\]\$ '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi
