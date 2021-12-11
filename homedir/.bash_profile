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
if [ -x /opt/homebrew/bin/brew ]; then
    for COMPLETION in "/opt/homebrew/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
fi

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Kubernetes
KUBEPS1=""
if [ -x /usr/local/bin/kubectl ]; then
    source <(kubectl completion bash)
    KUBEPS1=' \[\033[01;38;5;214m\](kube: $(kubectl config current-context))'

    # Handy function to quickly switch kubernetes context, they can be a pain otherwise...
    function kc() {
        values=$(kubectl config get-contexts -o name | sort)
        selection=$(echo $values | xargs -n 1 | awk '{print v++,$1}')
        arr=($values)
        tmpfile=$(mktemp)
        whiptail --menu "Please select a kubernetes context:" 25 75 12 $selection 2>$tmpfile
        choice=$(cat $tmpfile)
        rm -rf $tmpfile

        if [ "XXX$choice" != "XXX" ]; then
            kubectl config use-context ${arr[choice]}
        fi
    }
fi

# include git branch if we can get it
GITPS1=""
if [ "`type -t __git_ps1`" = 'function' ]; then
    GITPS1='\[\033[0;31m\]$(__git_ps1)'
fi

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w'${GITPS1}${KUBEPS1}'\[\033[00m\]\$ '

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/johans/Downloads/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/johans/Downloads/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/johans/Downloads/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/johans/Downloads/google-cloud-sdk/completion.bash.inc'
fi
