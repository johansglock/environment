# Include our global environment first
[ -f ~/.profile ] && . ~/.profile

# Basic options
setopt appendhistory autocd beep extendedglob nomatch notify prompt_subst

# Emacs keyboard style
bindkey -e

# Load autocompletion and version control modules
autoload -Uz compinit vcs_info

# Initialize auto completion
compinit

# Configure version control information
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats " %F{red}(%b)%f"

# Fill our vcs information
precmd () {
    vcs_info
}

# Set our prompt
PS1="%B%F{green}%n@%m:%f%F{blue}%~%f%b\$vcs_info_msg_0_$ "

# Mark a red background character for output that doesn't
# end with newline as featured by PROMPT_SP (default on).
PROMPT_EOL_MARK="%K{red} %k"
