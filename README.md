# My Configs

## Installing

```
git clone git@github.com:wyantb/Settings.git $HOME/.dotfiles

ln -s $HOME/.dotfiles/nvimrc $HOME/.nvimrc

# Install ZSH - brew install, or sudo apt-get install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# This actually needs to go before the line for oh-my-zsh sourcing itself, so move it once done
echo "[ -f $HOME/.dotfiles/zshrc ] && source $HOME/.dotfiles/zshrc" >> $HOME/.zshrc

# This can stay after oh-my-zsh sourcing
echo "ZSH_THEME=\"main\"" >> $HOME/.zshrc

# And install theme:
ln -s $DOTFILES_HOME/main.zsh-theme ~/.oh-my-zsh/themes/main.zsh-theme

# Basic config symlinks
mkdir -p $HOME/.config/nvim
ln -s $HOME/.dotfiles/vimrc $HOME/.config/nvim/init.vim
ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/profile $HOME/.profile
ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/hgrc $HOME/.hgrc

# Nvim added steps; optional if not using neovim, obv
mkdir -p $HOME/.config/nvim
ln -s $HOME/.dotfiles/vimrc $HOME/.config/nvim/init.vim
ln -s $HOME/.vim $HOME/.config/nvim/nvim

# if using flatpak (probably bad idea, can't exec shared bins):
#mkdir $HOME/.var/app/io.neovim.nvim/config/nvim/
#ln -s $HOME/.dotfiles/vimrc  $HOME/.var/app/io.neovim.nvim/config/nvim/init.vim

# Plugin manager, and getting it ready:
mkdir -p $HOME/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c PluginInstall!
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

# Preparing WakaTime (optional)
echo "Plugin 'wakatime/vim-wakatime'" >> $HOME/.dotfiles/vimrc
# then restart

# Installing fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### Mac-specific
```
brew install ag
brew install cmake
brew install reattach-to-user-namespace
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

