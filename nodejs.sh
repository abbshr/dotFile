INFO "安装 n Node.js"

if curl -fsSL https://git.io/n-install | bash -s -- -q; then
    export PATH=~/n/bin:$PATH
    if command -v n; then
        n lts && npm install -g autocannon node-gyp || ERROR "Node.js autocannon node-gyp 安装失败"
    else
        ERROR "n 安装失败"
    fi
else
    ERROR "n 安装失败"
fi