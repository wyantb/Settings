
export DOTFILES_HOME=$HOME/.dotfiles
if [ -f $DOTFILES_HOME/bashrc_private ]; then
    . $DOTFILES_HOME/bashrc_private
fi
. $DOTFILES_HOME/aliases

shopt -s expand_aliases

# A touch of color w/ just username/directory
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

[[ -s $HOME/.nvm/nvm.sh ]] && . /home/brian/.nvm/nvm.sh # Load NVM if present
[[ -d $HOME/.rvm/bin ]] && PATH=$PATH:$HOME/.rvm/bin # Load RVM if present

EXPECTED_JAVA_HOME=/usr/lib/jvm/java-7-oracle/
if [ -d $EXPECTED_JAVA_HOME ]; then
    export JAVA_HOME=$EXPECTED_JAVA_HOME
    # not necessary, but could do something like putting in path to the jre
    #inPath "$JAVA_HOME/bin" || PATH="$PATH:$JAVA_HOME/bin"
fi

export ANT_OPTS="-Xmx1536m -Xss2m -XX:MaxPermSize=512m"
export ANT_ARGS="-Dnosign=1 -Dnorepack=1"
EXPECTED_ANT_HOME=$HOME/progs/ant
if [ -d $EXPECTED_ANT_HOME ]; then
    export ANT_HOME=$EXPECTED_ANT_HOME
    inPath "$ANT_HOME/bin" || PATH="$PATH:$ANT_HOME/bin"
fi

EXPECTED_CCOLLAB_HOME=$HOME/progs/ccollab-cmdline
[[ -d $EXPECTED_CCOLLAB_HOME ]] && PATH=$PATH:$EXPECTED_CCOLLAB_HOME

export PATH

export VIMRUNTIME=/usr/share/vim/vim74/

export no_proxy="$no_proxy,10.140.*"

# I mean...Ubuntu should at least let some core dumps be present by default, right?...
ulimit -c unlimited

# Yes, allow **/*.js syntax plx
shopt -s globstar
