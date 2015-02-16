export GIT_EDITOR=vim
mesg n

# easily reload the profile if you ever edit it
alias profile="source ~/git/dotfiles/.profile"
alias be="bundle exec"

# tmux shortcuts
alias tn="tmux new -s" # [project-name]
alias tat="tmux at -t" # [project-name]
alias tls="tmux ls"

# git push origin [current branch]
alias gs="git status"
alias gc="git commit" # -a?m? "message with m arg"
alias gp="git push origin \`git status | grep 'On branch' | sed 's/On branch //'\`"

