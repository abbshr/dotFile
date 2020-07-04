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
