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

  ctrl-b d        # detatch from session
```

#### Managing Projects

```
  tls             # list project sessions by name: tmux ls

  tat project_name # attach to a session by name: tmux attach -t 
```

Ruby
----

For any ruby/rails project, from your root directory make and use a project specific rvm/ruby install.

### First Time Install

```bash
  cd my_project
  tn my_project
  build_rvm
```

### On Each Login

```bash
  tat my_project   # attach to tmux session
  ctrl-b c         # new tab for work
  load_rvm         # load rvm environment
```
