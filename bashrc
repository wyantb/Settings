
export DOTFILES_HOME=$HOME/.dotfiles
if [ -f $DOTFILES_HOME/aliases_private ]; then
    . $DOTFILES_HOME/aliases_private
fi
. $DOTFILES_HOME/aliases

# A touch of color w/ just username/directory
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

[[ -s $HOME/.nvm/nvm.sh ]] && . /home/brian/.nvm/nvm.sh # Load NVM if present
[[ -d $HOME/.rvm/bin ]] && PATH=$PATH:$HOME/.rvm/bin # Load RVM if present

if [ -d $DOTFILES_HOME/tig-completion.bash ]; then
    . $DOTFILES_HOME/tig-completion.bash
fi

PATH="$PATH:$DOTFILES_HOME/scripts/"
export PATH

export no_proxy="$no_proxy,10.140.*"

# I mean...Ubuntu should at least let some core dumps be present by default, right?...
ulimit -c unlimited

# Source fzf https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Setting ag as the default source for fzf
# Handy since I'll already setup ag to have ignored files
export FZF_DEFAULT_COMMAND='ag -g ""'
# And since fzf replaces my bash history ctrl-r, let's give it more history to work with
# http://www.mosbase.com/2010/05/increase-your-bash-history-size.html
export HISTSIZE=3000000
export HISTCONTROL=erasedups
shopt -s histappend
