INFO "安装 RVM Ruby"

if gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && curl -sSL https://get.rvm.io | bash -s stable --ruby --with-gems="pry"; then
    if [[ $(uname -s) != 'Darwin' ]]; then
        source /usr/local/rvm/scripts/rvm
    else
        source ~/.rvm/scripts/rvm
    fi
    if command -v rvm && command -v ruby; then
        INFO "RVM Ruby pry 安装成功"
    else
        ERROR "RVM Ruby pry 安装失败"
    fi
else
    ERROR "RVM Ruby 安装失败"
fi