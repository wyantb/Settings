
# if running bash
if [ -n "$BASH_VERSION" ]; then
    . "$HOME/.bashrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    inPath "$HOME/bin" || PATH="$HOME/bin:$PATH"
fi

