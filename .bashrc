# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
shopt -s expand_aliases

if [ -f ~/.bash_startup ]; then
    . ~/.bash_startup
fi

# A touch of color w/ just username/directory
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

