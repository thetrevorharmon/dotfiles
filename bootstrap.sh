# install oh-my-zsh via curl
echo "📥  Oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# grab zsh-autosuggestions
echo "📥  zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Clone the powerlevel10k theme to the appropriate place
echo "📥  powerlevel10k (zsh theme)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

if [[ $OSTYPE == 'darwin'* ]]; then
  # copy the zshrc file
  echo "⚙️  Setting up shell aliases"
  cp zshrc ~/.zshrc

  # Copy powerlevel10k config to the appropriate place
  echo "⚙️  Setting up zsh theme config"
  cp p10k.zsh ~/.p10k.zsh

  # copy the theme
  echo "⚙️  Setting up zsh theme"
  cp powerlevel10k.zsh-theme ~/powerlevel10k/powerlevel10k.zsh-theme
fi

if [[ "$SPIN" = 1 ]]
then
  # Copy powerlevel10k config to the appropriate place
  ln -sf ~/dotfiles/p10k.zsh ~/.p10k.zsh

  # link the zshrc file
  ln -sf ~/dotfiles/zshrc ~/.zshrc
fi

echo "⌨️  Set up Git defaults"

# Git aliases
git config --global alias.amend 'commit --amend --no-edit'
git config --global alias.continue 'rebase --continue'
git config --global alias.tree "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.refresh '!f() { git checkout main && git pull origin main && git checkout - && git rebase main; }; f'

# Git settings
git config --global core.editor 'code --wait'
git config --global pull.rebase true

if [[ $OSTYPE == 'darwin'* ]]; then
  # install brew
  echo "📥 Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  

  # install rocket
  echo "📥 Rocket (emoji picker)"
  brew install --cask rocket

  # install vanilla
  echo "📥 Vanilla (tidy up the menu bar)"
  brew install --cask vanilla

  # install KeepingYouAwake
  echo "📥 KeepingYouAwake"
  brew install --cask keepingyouawake
  
  # install Alfred
  echo "📥 Alfred"
  brew install --cask alfred
  
  # install MeetingBar
  echo "📥 MeetingBar"
  brew install --cask meetingbar
  
  # install VS Code
  echo "📥 VS Code"
  brew install --cask visual-studio-code
  
  # Get JetBrains Mono font
  echo "📥 Download JetBrains Mono"
  brew tap homebrew/cask-fonts
  brew install --cask font-jetbrains-mono
  
  # Quick look markdown
  echo "📥 QLMarkdown"
  brew install --cask qlmarkdown
fi
