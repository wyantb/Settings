# My Configs

## Installing

```
git clone git://github.com/wyantb/Settings.git ~/.dotfiles
echo "[[ -f ~/.dotfiles/bashrc ]] && . ~/.dotfiles/bashrc" >> ~/.bashrc
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/profile ~/.profile
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/hgrc ~/.hgrc

# NeoBundle, and getting it ready:
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim -c NeoBundleInstall!
```

### Hooks for a given repo

```
# Puts details of commits about to be pushed into sys clipboard
ln -s $HOME/.dotfiles/scripts/pre-push-tweet.py .git/hooks/pre-push
```

## Uninstalling

```
rm ~/.vimrc
rm ~/.tmux.conf
rm ~/.profile
rm ~/.gitconfig
rm ~/.hgrc
```

