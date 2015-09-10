# Dotfiles

## Github Setup

Create your ssh key to talk to github without username and password prompts.

```
  ssh-keygen -t rsa -b 4096 -C smith11235@gmail.com
  # > hit enter to use default: ~/.ssh/id_rsa
  # > hit enter to have no password
```

Configure your username and email settings 1 time

```
  git config --global user.name "Michael Smith"
  git config --global user.email smith11235@gmail.com

```
  
Go to **github.com/settings/ssh** to add your new ssh key to github.

From your server copy the contents of **~/.ssh/id_rsa.pub** and add it to the github key.

Name it after your development environment.

## Dotfiles Setup

Get this repo, and load it to your environment so all the helper scripts and commands are available.

Specifically [./profile](profile).

```
  git clone git@github.com:smith11235/dotfiles.git
  cd dotfiles
  ruby dotfiles.rb
```

If ruby isnt installed, run `sudo apt-get install ruby -y`

Tmux
----

Use it.  Love it.

#### Start A New Project Session

```
  tn project_name # new session: tmux new -s
```

#### Use Multiple Tabs

```
  ctrl-b c        # new tab
  ctrl-b n        # next tab
  ctrl-b l        # last tab

  # close a tab by 'exit'ing
  exit
```

#### Detach From Your Session

Either detach and exit, or just close your terminal window.

Detaching lets you return to your work later as if you never left.

```
  ctrl-b d        # detatch from session
```

#### Reattach To Your Session

```
  ssh user@my-server.com

  tls              # list project sessions by name: tmux ls
  > project_name
  > my-project
  > my-other-project

  tat project_name # attach to a session by name: tmux attach -t 
```

## Ruby

For any ruby/rails project, from your root directory make and use a project specific rvm/ruby install.

#### First Time Install

```bash
  cd my_project
  tn my_project    # new tmux session in this directory
  which rvm # ensure none is found
  which rails # ensure none is found
  build_rvm        # build rvm, install Gemfile
```

#### Returning to Work

```bash
  tat my_project   # attach to tmux session where you left off
  ctrl-b c         # new tab for work
  load_rvm         # load rvm environment
  rails server
```

## Working with Git

Starting work for a new ticket/task, start a branch off master

```
  git checkout master
  gpull                               # pull current branch from github

  git checkout -b my-new-branch
    
  # edit files for your work
  ...

  gs                                  # git status
  gd                                  # git diff

  gc -am "got some feature to work"   # git commit

  gp                                  # push current branch to github
```
