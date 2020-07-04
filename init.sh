#!/usr/bin/env bash

set -e

source b-log/b-log.sh

# log all level
LOG_LEVEL_ALL

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

if [[ $(uname -s) == 'Darwin' ]]; then
    source init-darwin.sh
else
    source init-linux.sh
fi

export https_proxy="http://${PROXY_ADDR}:7890"
export http_proxy="http://${PROXY_ADDR}:7890"
export all_proxy="socks5://${PROXY_ADDR}:7891"

cat <<EOF >> ~/.bashrc
export https_proxy="http://${PROXY_ADDR}:7890"
export http_proxy="http://${PROXY_ADDR}:7890"
export all_proxy="socks5://${PROXY_ADDR}:7891"
EOF

if [[ $(uname -s) == 'Darwin' ]]; then
    NOTICE "安装 homebrew"
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /usr/bin/env bash

    if [[ ${PIPESTATUS[0]} != 0 ]]; then
        ERROR "brew 安装失败"
        exit 1
    else
        INFO "brew 安装成功"
    fi

    arr=($(cat macOS/brew-list.txt))
    DEBUG "brew list: ${arr[*]}"
    brew install ${arr[@]}
fi

install-nodejs() {
  INFO "安装 Node.js"
  curl -sS https://git.io/n-install | bash -s -- -q
  if [[ $? != 0 ]]; then
    ERROR "node.js 下载失败"
  else
    export PATH=~/n/bin:$PATH
    if command -v n; then
        n lts
        npm install -g autocannon node-gyp
    else
      ERROR "node.js lts 安装失败"
    fi
  fi
}

install-ruby() {
  INFO "安装 Ruby"
  wget -qO - https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz | tar xzv
  if [[ $? != 0 ]]; then
    ERROR "Ruby 下载失败"
  else
    cd ruby-install-0.7.0
    make install
    cd -
    if command -v ruby; then
        gem install pry
    else
      ERROR "Ruby 安装失败"
    fi
  fi
}

install-nodejs
install-ruby

source rustup-cfg.sh
