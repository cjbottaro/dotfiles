# Dotfiles

## Fresh install

Clone this repository into `~/dotfiles`, then run the platform setup script:

```bash
./setup-linux.sh
```

or:

```bash
./setup-macos.sh
```

Stow the dotfiles from the repository directory:

```bash
stow --target="$HOME" .
```

The platform setup script also selects the matching Ghostty overrides by
linking `~/.config/ghostty/platform` to either the tracked `linux` or `macos`
configuration. Shared Ghostty settings live in `common`.

### Brave web apps on GNOME

Brave's installed-web-app state lives in its browser profile and is not part of
this repository. On a fresh Linux installation, install the desired web apps in
Brave first. Then run:

```bash
./restore-brave-apps
```

The restore script replaces only the Brave launchers and icons tracked here. If
Brave generated conflicting files, it moves them to
`~/.local/state/dotfiles/brave-app-backups/` before linking the corrected files.
It also rebuilds the desktop and icon caches.

Run the restore script again after reinstalling one of these Brave apps. A newly
added Brave app must have its corrected launcher and icons committed to this
repository before the script can manage it.
