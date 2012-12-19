# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
shopt -s expand_aliases

export PATH=$PATH:~/progs/node/bin
export PATH=$PATH:~/bin/fast-export
export PATH=$PATH:~/.dropbox-dist
