require 'fileutils'
require 'yaml'
require 'rubygems'
require 'colorize'

require File.expand_path( "../dotfiles.rb", __FILE__ )

# create a task for each of the files we're deploying
dotfile_tasks = Dotfiles.files.collect do |dotfile|
  dotfile_task_name = "deploy_#{dotfile[/\w+/]}".to_sym
  desc "Deploy #{dotfile}"
  task dotfile_task_name do
    overwrite = ENV["OVERWRITE"] # will either be nil or something
    Dotfiles.deploy(dotfile, overwrite)
  end
  dotfile_task_name
end

# create a task that deploys all the files
desc "Setup all config files and profiles"
task :deploy_dotfiles do
  overwrite = ENV["OVERWRITE"] # will either be nil or something
  # copy .vimrc and overrite
  Dotfiles.deploy(".vimrc", overwrite)

  # add to all profile files a source call to git/dotfiles/.profile
  profile_files = %w(
    ~/.profile
    ~/.bash_profile
    ~/.bashrc
    ~/.zlogin
    ~/.zshrc
  )

  profile_files.each do |profile_file|
    next unless File.file? profile_file
    cmd ="echo 'source ~/git/dotfiles/.profile' >> #{profile_file}"
    raise "Could not add to #{profile_file}" unless system(cmd)
  end

  puts "Now run: $ source ~/git/dotfiles/.profile".yellow
end

