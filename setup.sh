#!/bin/bash
set -e

if [[ "$(uname)" == "Linux" ]]; then
  FONT_DIR=~/.local/share/fonts/

  sudo cp keyd.conf /etc/keyd/default.conf
  sudo systemctl enable keyd
  sudo systemctl restart keyd
fi

if [[ "$(uname)" == "Darwin" ]]; then
  FONT_DIR=~/Library/Fonts
fi

if [ ! -f "$FONT_DIR/.local/share/fonts/BitstromWeraNerdFontMono-Bold.ttf" ]; then
  wget -q -P ~/Downloads https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/BitstreamVeraSansMono.zip
  rm -rf ~/Downloads/BitstreamVeraSansMono
  unzip -qo ~/Downloads/BitstreamVeraSansMono.zip -d ~/Downloads/BitstreamVeraSansMono
  mv ~/Downloads/BitstreamVeraSansMono/BitstromWeraNerdFontMono-Bold.ttf $FONT_DIR
  mv ~/Downloads/BitstreamVeraSansMono/BitstromWeraNerdFontMono-Regular.ttf $FONT_DIR
  rm -rf ~/Downloads/BitstreamVeraSansMono*
  if [[ "$(uname)" == "Linux" ]]; then
    fc-cache $FONT_DIR
  fi
fi