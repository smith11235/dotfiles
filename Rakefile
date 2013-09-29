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
		Dotfiles.deploy( dotfile )
	end

	dotfile_task_name
end

# create a task that deploys all the files
desc "Copy all provided dotfiles to the users root"
task :deploy_all_dotfiles => dotfile_tasks do
	puts "Now run: $ source ~/.profile".red
end

