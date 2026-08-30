#!/usr/bin/env bash
set -euo pipefail

repo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
font_dir="${HOME}/.local/share/fonts"
font_file="${font_dir}/BitstromWeraNerdFontMono-Bold.ttf"

# brew bundle --file="${repo_dir}/Brewfile"

fedora_version=$(rpm -E %fedora)
sudo wget \
  "https://copr.fedorainfracloud.org/coprs/alternateved/keyd/repo/fedora-${fedora_version}/alternateved-keyd-fedora-${fedora_version}.repo" \
  -O /etc/yum.repos.d/_copr:alternateved:keyd.repo
sudo wget \
  "https://copr.fedorainfracloud.org/coprs/scottames/ghostty/repo/fedora-${fedora_version}/scottames-ghostty-fedora-${fedora_version}.repo" \
  -O /etc/yum.repos.d/_copr:scottames:ghostty.repo

rpm-ostree refresh-md
rpm-ostree install keyd ghostty

sudo mkdir -p /etc/keyd
sudo cp "${repo_dir}/keyd.conf" /etc/keyd/default.conf
# sudo systemctl enable keyd
# sudo systemctl restart keyd

mkdir -p "${font_dir}" "${HOME}/Downloads"
if [[ ! -f "${font_file}" ]]; then
  font_archive="${HOME}/Downloads/BitstreamVeraSansMono.zip"
  wget -q \
    -O "${font_archive}" \
    https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/BitstreamVeraSansMono.zip
  unzip -jo "${font_archive}" \
    BitstromWeraNerdFontMono-Bold.ttf \
    BitstromWeraNerdFontMono-Regular.ttf \
    -d "${font_dir}"
  rm -f -- "${font_archive}"
  fc-cache "${font_dir}"
fi

printf '%s\n' \
  'After installing Brave web apps, run ./restore-brave-apps to restore their GNOME launchers and icons.'
