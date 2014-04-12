
if [ -f ~/.dotfiles/.aliases ]; then
    . ~/.dotfiles/.aliases
fi
shopt -s expand_aliases

# A touch of color w/ just username/directory
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

[[ -s /home/brian/.nvm/nvm.sh ]] && . /home/brian/.nvm/nvm.sh

