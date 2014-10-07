Configuration
===========

My personal configuration files for software like vim.

Install through this easy one-liner:

    git clone https://github.com/johansglock/environment.git ~/.shell-config \
        && ~/.shell-config/install.sh && (([ `basename $SHELL` = 'bash' ] && source ~/.bash_profile) \
        || ([ `basename $SHELL` = 'zsh' ] && source ~/.zshrc))
        
Easy Commands
===========

After installation you will have a few handy commands at your disposal:

Updating your profile:

    update-env
    
Becoming root through sudo while keeping your profile intact:

    root
    
