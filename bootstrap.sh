if [[ "$SPIN" = 1 ]]
then
  # install oh-my-zsh via curl
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # grab zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  # Copy powerlevel10k theme to the appropriate place
  ln -sf ~/dotfiles/p10k.zsh ~/.p10k.zsh
  ln -sf ~/dotfiles/powerlevel10k.zsh-theme ~/powerlevel10k/powerlevel10k.zsh-theme

  # link the zshrc file
  ln -sf ~/dotfiles/zshrc ~/.zshrc

  # specifically load for shopify
  if [[ "$SPIN_REPO_SOURCE_PATH" = "/src/github.com/shopify/shopify" ]]
  then
    cd "$SPIN_REPO_SOURCE_PATH"

    # set reportify config
    cartridge insert thetrevorharmon/shopify-reportify-config
    . /cartridges/shopify-reportify-config/setup.sh
    restart
  fi
fi
