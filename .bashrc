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

