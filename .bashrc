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
    PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
    eval "$(/opt/homebrew/bin/brew shellenv bash)"
    . ~/Work/multiverse/env.sh
fi

if [[ -f "$HOME/.secrets" ]]; then
    source "$HOME/.secrets"
fi

if [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]]; then
    . "/opt/homebrew/etc/profile.d/bash_completion.sh"
fi

if [[ -f "$HOME/.kubectl-completion" ]]; then
    source "$HOME/.kubectl-completion"
fi

if [[ "$(uname)" == "Linux" ]]; then
  alias code='flatpak run com.visualstudio.code'
fi

# Turn on shell history for Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# Disable tab completion
export EXECIGNORE=/opt/homebrew/bin/kubectl.lima:/usr/local/bin/kubetail

# asdf
if command -v asdf >/dev/null; then
    export PATH="$HOME/.asdf/shims:$PATH"
    . <(asdf completion bash)
fi

# mise
if command -v mise >/dev/null 2>&1; then
    eval "$(mise activate bash)"
fi

export MANGOHUD=1
eval "$(starship init bash)"
eval "$(direnv hook bash)"
alias ls="eza --icons"
