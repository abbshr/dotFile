NOTICE "安装 homebrew"
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /usr/bin/env bash

if [[ $? != 0 ]]; then
    ERROR "brew 安装失败"
else
    INFO "brew 安装成功"

    arr=($(cat macOS/brew-list.txt))
    NOTICE "安装预置的 brew list: ${arr[*]}"
    brew install ${arr[@]}
fi