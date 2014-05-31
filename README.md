# My Configs

## Installing

```
git clone git://github.com/wyantb/Settings.git $HOME/.dotfiles
echo "[[ -f $HOME/.dotfiles/bashrc ]] && . $HOME/.dotfiles/bashrc" >> $HOME/.bashrc
ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/profile $HOME/.profile
ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/hgrc $HOME/.hgrc

# NeoBundle, and getting it ready:
mkdir -p $HOME/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
vim -c NeoBundleInstall!
```

### Hooks for a given repo

```
# Puts details of commits about to be pushed into sys clipboard
ln -s $HOME/.dotfiles/scripts/pre-push-tweet.py .git/hooks/pre-push
```

## Uninstalling

```
rm $HOME/.vimrc
rm $HOME/.tmux.conf
rm $HOME/.profile
rm $HOME/.gitconfig
rm $HOME/.hgrc
```

