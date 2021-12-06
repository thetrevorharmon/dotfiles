# install oh-my-zsh via curl
echo "📥  Downloading & installing Oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# grab zsh-autosuggestions
echo "📥  Downloading & installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Clone the powerlevel10k theme to the appropriate place
echo "📥  Downloading & installing powerlevel10k"
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

  # specifically load for shopify
  if [[ "$SPIN_REPO_SOURCE_PATH" = "/src/github.com/shopify/shopify" ]]
  then
    cd "$SPIN_REPO_SOURCE_PATH"

    # set reportify config
    cartridge insert thetrevorharmon/setup-shopify-config
    . /cartridges/setup-shopify-config/setup.sh
    restart
  fi
fi
