alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# add ssh priavte keys
for pk_name in $(ls ~/.ssh/*.pub 2>/dev/null); do
  ssh-add ${pk_name/.pub} &> /dev/null
done

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source ~/.config/terminal_theme.sh;
