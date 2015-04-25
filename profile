#!/bin/bash

export GIT_EDITOR=vim
mesg n

# easily reload the profile if you ever edit it
alias profile="source ~/dotfiles_profile"
alias load_rvm="source ~/dotfiles_load_rvm_environment"
alias build_rvm="source ~/dotfiles_build_rvm_environment"

# if youre still using bundle...
alias be="bundle exec"

# tmux shortcuts
alias tn="tmux new -s" # [project-name]
alias tat="tmux at -t" # [project-name]
alias tls="tmux ls"

# git push origin [current branch]
alias gs="git status"
alias gc="git commit" # -a?m? "message with m arg"
alias gd="git diff"
alias gp="git push origin \`git status | grep 'On branch' | sed 's/On branch //'\`"
alias gpull="git pull origin \`git status | grep 'On branch' | sed 's/On branch //'\`"
alias gb="git branch"

