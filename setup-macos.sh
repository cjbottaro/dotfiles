#!/usr/bin/env bash
set -euo pipefail

repo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
font_dir="${HOME}/Library/Fonts"
font_file="${font_dir}/BitstromWeraNerdFontMono-Bold.ttf"

# brew bundle --file="${repo_dir}/Brewfile"

mkdir -p "${font_dir}" "${HOME}/Downloads"
if [[ ! -f "${font_file}" ]]; then
  font_archive="${HOME}/Downloads/BitstreamVeraSansMono.zip"
  curl -fL \
    -o "${font_archive}" \
    https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/BitstreamVeraSansMono.zip
  unzip -jo "${font_archive}" \
    BitstromWeraNerdFontMono-Bold.ttf \
    BitstromWeraNerdFontMono-Regular.ttf \
    -d "${font_dir}"
  rm -f -- "${font_archive}"
fi
