# add ssh keys
for pk_name in (ls ~/.ssh/*.pub)
    ssh-add (string split -r -m1 . $pk_name)[1] ^/dev/null
end

set -xg EDITOR /usr/local/bin/code
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# greetings help
function hp
    cat $HOME/.config/fish/greet
end

set -xg PATH $PATH $HOME/.cargo/bin
set -xg PATH $PATH $HOME/.deno/bin

set -xg RUSTUP_DIST_SERVER "https://mirrors.ustc.edu.cn/rust-static"
set -xg RUSTUP_UPDATE_ROOT "https://mirrors.ustc.edu.cn/rust-static/rustup"
