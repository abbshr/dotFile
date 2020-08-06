ps -aux | grep -v "grep" | grep ssh-agent &> /dev/null
if [[ $? != 0 ]]; then
  eval $(ssh-agent -s) &> /dev/null
  cat <<EOF > ~/.sshagentrc
export SSH_AGENT_PID=$SSH_AGENT_PID
export SSH_AUTH_SOCK=$SSH_AUTH_SOCK
EOF
else
  source ~/.sshagentrc
fi

export LANG="zh_CN.UTF-8"
export LANGUAGE="zh_CN:zh"
export LC_ALL="zh_CN.UTF-8"
export EDITOR="/usr/bin/vim"

export MACOS_PATH="/Users/xxx/mnt-linux"

code() {
    local SPEC_DIR=$(realpath ${1})
    local SUB_SPEC_DIR=${SPEC_DIR/\/root}
    ssh mac "code ${MACOS_PATH}${SUB_SPEC_DIR}"
}

export TZ='Asia/Shanghai'

# add ssh priavte keys
for pk_name in $(ls ~/.ssh/*.pub 2>/dev/null); do
  ssh-add ${pk_name/.pub} &> /dev/null
done
