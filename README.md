Dotfiles
========

Setup
-----

```
  git clone https://github.com/smith11235/dotfiles.git
  cd dotfiles
  ruby dotfiles.rb
```

Tmux
----

Use it.  Love it.

#### New Project Session

```
  tn project_name # new session: tmux new -s
```

#### Tabs

```
  ctrl-b c        # new tab
  ctrl-b n        # next tab
  ctrl-b l        # last tab

  # close a tab by 'exit'ing
```

#### Detach From Your Session

And return later.  

```
  ctrl-b d        # detatch from session
```

It lets you leave your work and return as if you had never left.

Lowering the context switch cost of taking a break or working on multiple projects.

#### Reattaching

```
  tls              # list project sessions by name: tmux ls

  tat project_name # attach to a session by name: tmux attach -t 
```

Github
------

```
  ssh-keygen -t rsa -b 4096 -C smith11235@gmail.com
  # enter, nopass
  # enter, ~/.ssh/id_rsa
  # add it to your personal settings ssh keys in github
  
  git config --global user.name "Michael Smith"
  git config --global user.email smith11235@gmail.com
```

Ruby
----

For any ruby/rails project, from your root directory make and use a project specific rvm/ruby install.

### First Time Install

```bash
  cd my_project
  tn my_project    # new tmux session in this directory
  build_rvm        # build rvm, install Gemfile
```

### Returning to Work

```bash
  tat my_project   # attach to tmux session where you left off
  ctrl-b c         # new tab for work
  load_rvm         # load rvm environment
```
