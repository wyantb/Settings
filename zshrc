
export DOTFILES_HOME=$HOME/.dotfiles

fpath=(/usr/local/share/zsh-completions $fpath)
export plugins=(git osx)
#ZSH_THEME="main"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f $DOTFILES_HOME/aliases ] && source ~/.dotfiles/aliases
[ -f $DOTFILES_HOME/aliases_private ] && source ~/.dotfiles/aliases_private
[ -f $DOTFILES_HOME/tig-completion.zsh ] && source $DOTFILES_HOME/tig-completion.zsh
[ -d $HOME/flatrun ] && export PATH="$PATH:$HOME/flatrun"
PATH="$PATH:$HOME/bin"

export NVM_DIR="$HOME/.nvm"
[ -f /usr/local/opt/nvm/nvm.sh ] && . "/usr/local/opt/nvm/nvm.sh"

##############################################################################
# History Configuration
##############################################################################
HISTSIZE=3000000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=3000000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
export HISTSIZE=3000000               #How many lines of history to keep in memory
export HISTFILE=~/.zsh_history     #Where to save history to disk
export SAVEHIST=3000000               #Number of history entries to save to disk
export HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt incappendhistory #Immediately append to the history file, not just when a term is killed
