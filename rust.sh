#!/usr/bin/env bash

# dep:
# - socks5 proxy configured
# - curl installed
# - brew installed

# export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
# export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"

type rustup &> /dev/null && exit 0

if curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y; then
    source ~/.cargo/env
    cat ~/.cargo/env >> ~/.bashrc

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
    rustup component add rls rust-analysis || WARN "rls rust-analysis 安装失败"

    command -v sccache || cargo install sccache || WARN "sccache 安装失败"

    cargo install procs bat exa fd-find ripgrep jql || WARN "辅助软件安装失败"
else
    echo "rustup 安装失败"
fi