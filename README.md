Dotfiles
========

Setup
-----

```
  git clone https://github.com/smith11235/dotfiles.git
  cd dotfiles
  rake deploy_dotfiles
```

Tmux
----

Use it.  Love it.

Ruby
----

My standard operating procedure for any ruby/rails project.

Add these files to your project repo, and execute:

```
  source ./build_rvm_environment

  source ./load_rvm_environment
  which ruby
  spring rails server # no need for bundle exec
```
