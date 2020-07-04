alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export PS1="\[\033[1;37m\]\u@\[\033[1;33m\]\H:\[\033[1;34m\]\w\[\033[00m\]$ "
export EDITOR=/usr/local/bin/code
export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"

# add ssh priavte keys
for pk_name in $(ls ~/.ssh/*.pub); do
  ssh-add ${pk_name/.pub} &> /dev/null
done

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
