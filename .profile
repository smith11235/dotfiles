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

# tmux shortcuts
alias tat="tmux at -t"
alias tls="tmux ls"

# linode server
alias dev="ssh root@twostepsleftofnormal.com"
