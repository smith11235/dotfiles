# ~/.profile: executed by Bourne-compatible login shells.
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
export GIT_EDITOR=vim
mesg n

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

alias be="bundle exec"
alias profile="source ~/.profile"

# tmux shortcuts
alias tat="tmux at -t"
alias tls="tmux ls"

# git shortcuts
alias gs="git status"
alias ga="git add" # . or a file path
alias gc="git commit" # -a?m? "message with m arg"
alias gm="git merge --no-ff" # <branch>
alias gp="git push -u origin master"


# linode server
alias dev="ssh root@twostepsleftofnormal.com"
