config-system() {
  WARN "sh 链接到 bash"
  rm -rf /bin/sh
  ln -s /bin/bash /bin/sh

  # 换源 bionic (18.04)
  cp -a linux/sources.bionic.list /etc/apt/sources.list

  # 剪裁系统缺失开发套件和 man page，这里还原完整版
  NOTICE "正在恢复镜像中被裁减的软件"
  yes | unminimize #&> /dev/null

  # 中文环境
  NOTICE "设置中文环境"
  locale-gen zh_CN.UTF-8
}

config-bash() {
  cat linux/.bashrc >> ~/.bashrc
}

install-operation-tools() {
  INFO "安装运维工具"
  pip install ansible
}

install-dependencies() {
  NOTICE "apt: 软件更新"
  export DEBIAN_FRONTEND=noninteractive
  apt update -yq; apt dist-upgrade -yq #&> /dev/null
  apt install -yq --reinstall ca-certificates #&> /dev/null
  INFO "apt: 安装开发套件"
  apt install -yq ubuntu-server git git-core gcc g++ make gyp automake bison openssl autoconf libssl-dev libtool build-essential zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev libxslt-dev libc6-dev ncurses-dev libcurl4-openssl-dev libapr1-dev libaprutil1-dev libx11-dev libffi-dev tcl-dev tk-dev libcap2-bin libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential libpixman-1-dev dump traceroute cifs-utils hostapd openssh-server net-tools iptstate ufw python-pip psmisc privoxy autossh manpages-zh linux-tools-common linux-tools-generic sysstat iproute2 rar unrar sshfs nmap jq pv jnettop nethogs iftop unzip zip #&> /dev/null
  unset DEBIAN_FRONTEND
}

perf-config() {
  echo 0 > /proc/sys/kernel/kptr_restrict
}

main() {
  config-bash
  config-system
  install-dependencies
  install-operation-tools

  true
}

main