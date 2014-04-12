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
```

## Uninstalling

```
rm ~/.vimrc
rm ~/.tmux.conf
rm ~/.profile
rm ~/.gitconfig
rm ~/.hgrc
```

