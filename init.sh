#!/usr/bin/env bash

set -e
set -o pipefail

source b-log/b-log.sh

# log all level
# - OFF
# - FATAL
# - ERROR
# - WARN
# - NOTICE
# - INFO
# - DEBUG
# - TRACE
# - ALL
DOTFILE_LOG_LEVEL="LOG_LEVEL_${DOTFILE_LOG_LEVEL:=ALL}"
B_LOG --log-level ${!DOTFILE_LOG_LEVEL}

# pre-required:
# - socks5 proxy configured

mkdir -p ~/.ssh
mkdir -p ~/.config

mkdir -p ~/{test,github,gitlab,personal,downloads,config}

cp -a git/ ~/
cp -a .vim ~/
cp -a .vimrc ~/
cp -a fish ~/.config/
cp -a htop ~/.config/
cp -a .bashrc ~/
cp -a .gemrc ~/

if [[ -n $PROXY_ADDR ]]; then
    export https_proxy="http://${PROXY_ADDR}:7890"
    export http_proxy="http://${PROXY_ADDR}:7890"
    export all_proxy="socks5://${PROXY_ADDR}:7891"

cat <<EOF >> ~/.bashrc
export https_proxy="http://${PROXY_ADDR}:7890"
export http_proxy="http://${PROXY_ADDR}:7890"
export all_proxy="socks5://${PROXY_ADDR}:7891"
EOF
fi

if [[ $(uname -s) == 'Darwin' ]]; then
    source init-darwin.sh
else
    source init-linux.sh
fi

if [[ $(uname -s) == 'Darwin' ]]; then
    chown -R $USER /usr/local/

    source brew.sh

    # 切换 login shell
    if [[ -r "/usr/local/bin/bash" ]]; then
        sudo echo "/usr/local/bin/bash" >> /etc/shells
        chsh -s /usr/local/bin/bash
    else
        WARN "未能切换登录 shell 为 bash"
    fi
fi

source nodejs.sh
source ruby.sh
source rust.sh
source deno.sh
