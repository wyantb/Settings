# My Configs

## Installing

```
git clone git://github.com/wyantb/Settings.git $HOME/.dotfiles
echo "[[ -f $HOME/.dotfiles/bashrc ]] && . $HOME/.dotfiles/bashrc" >> $HOME/.bashrc
ln -s $HOME/.dotfiles/nvimrc $HOME/.nvimrc
ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/profile $HOME/.profile
ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/hgrc $HOME/.hgrc

# Plugin manager, and getting it ready:
mkdir -p $HOME/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c PluginInstall!

# Installing fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### Hooks for a given repo

```
# Puts details of commits about to be pushed into sys clipboard
ln -s $HOME/.dotfiles/scripts/pre-push-tweet.py .git/hooks/pre-push
```

## Uninstalling

```
rm $HOME/.nvimrc
rm $HOME/.tmux.conf
rm $HOME/.profile
rm $HOME/.gitconfig
rm $HOME/.hgrc
```

