#!/bin/bash
set -e

if [[ "$(uname)" == "Linux" ]]; then
  sudo cp keyd.conf /etc/keyd/default.conf
  sudo systemctl enable keyd
  sudo systemctl restart keyd

  if [ ! -f "$HOME/.local/share/fonts/BitstromWeraNerdFontMono-Bold.ttf" ]; then
    wget -q -P ~/Downloads https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/BitstreamVeraSansMono.zip
    rm -rf ~/Downloads/BitstreamVeraSansMono
    unzip -qo ~/Downloads/BitstreamVeraSansMono.zip -d ~/Downloads/BitstreamVeraSansMono
    mv ~/Downloads/BitstreamVeraSansMono/BitstromWeraNerdFontMono-Bold.ttf ~/.local/share/fonts/
    mv ~/Downloads/BitstreamVeraSansMono/BitstromWeraNerdFontMono-Regular.ttf ~/.local/share/fonts/
    rm -rf ~/Downloads/BitstreamVeraSansMono*
    fc-cache ~/.local/share/fonts/
  fi
fi

if [[ "$(uname)" == "Darwin" ]]; then
  
fi