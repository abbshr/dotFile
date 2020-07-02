[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export PS1="\[\033[1;37m\]\u@\[\033[1;33m\]\H:\[\033[1;34m\]\w\[\033[00m\]$ "

export EDITOR=/usr/local/bin/code

# add ssh priavte keys
for pk_name in $(ls ~/.ssh/*.pub); do
  ssh-add ${pk_name/.pub} &> /dev/null
done

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#
# # some more ls aliases
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

[[ -s ~/.bashrc ]] && source ~/.bashrc
