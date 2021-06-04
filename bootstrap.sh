if [[ "$SPIN" = 1 ]]
then
  # install oh-my-zsh via curl
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # grab zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  # Clone the powerlevel10k theme to the appropriate place
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

  # Copy powerlevel10k config to the appropriate place
  ln -sf ~/dotfiles/p10k.zsh ~/.p10k.zsh

  # link the zshrc file
  ln -sf ~/dotfiles/zshrc ~/.zshrc

  # specifically load for shopify
  if [[ "$SPIN_REPO_SOURCE_PATH" = "/src/github.com/shopify/shopify" ]]
  then
    cd "$SPIN_REPO_SOURCE_PATH"

    # set reportify config
    cartridge insert shameelabd/shopify-reportify-config
    . /cartridges/shopify-reportify-config/setup.sh
    restart
  fi

  # try to get the most recent version
  git fetch origin master
  git pull
fi
