#!/usr/bin/env bash

# dep:
# - socks5 proxy configured
# - curl installed
# - brew installed

type rustup &> /dev/null && exit 0

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

if [[ $? != 0 ]]; then
    echo "rustup 安装失败"
    exit 1
fi

source ~/.cargo/env

# enable tab completion
# Bash
if [[ $(uname -s) == 'Darwin' ]]; then
    rustup completions bash > $(brew --prefix)/etc/bash_completion.d/rustup.bash-completion
else
    mkdir -p ~/.local/share/bash-completion/completions/
    rustup completions bash > ~/.local/share/bash-completion/completions/rustup
fi

# Fish
mkdir -p ~/.config/fish/completions
rustup completions fish > ~/.config/fish/completions/rustup.fish

# IDE plugin
rustup component add rls rust-analysis