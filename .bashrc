# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Compact bash history
export HISTCONTROL=ignoreboth
shopt -s histappend

# macOS specific stuff
if [[ "$(uname)" == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    . ~/Work/multiverse/env.sh
fi


if [[ "$(uname)" == "Linux" ]]; then
  alias code='flatpak run com.visualstudio.code'
fi

# Turn on shell history for Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# Disable tab completion
export EXECIGNORE=/opt/homebrew/bin/kubectl.lima:/usr/local/bin/kubetail

export MANGOHUD=1
eval "$(starship init bash)"
alias ls="eza --icons"
