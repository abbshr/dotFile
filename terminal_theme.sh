append_git_status_after_prompt() {
  if [[ -d .git ]]; then
    if [[ -z $(git status -s) ]]; then
       git_status="\033[0;32m($(git branch --show-current) ✔)\033[0m"
    else
       git_status="\033[0;31m($(git branch --show-current) ✗)\033[0m"
    fi
    export PS1="${_PS1}$git_status "
  else
    export PS1="$_PS1"
  fi
}

_PS1="\[\033[1;37m\]\u@\[\033[1;33m\]\H:\[\033[1;34m\]\w\[\033[00m\]$ "
export PS1=$_PS1
export PROMPT_COMMAND='append_git_status_after_prompt'