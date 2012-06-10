# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias sadd="ssh-add"
alias keepass="mono ~/bin/KeePass/KeePass.exe /media/truecrypt1/Keys/bmw-main.kdbx -preselect:/media/truecrypt1/Keys/secret-key-D668DB8D.asc &"
alias cls="clear; ls"
alias dbox="dropbox > /dev/null 2>&1 &"

export PATH=$PATH:~/bin/fast-export
export PATH=$PATH:~/.dropbox-dist
