require 'fileutils'
require 'yaml'

desc "Setup .vimrc and user profile"
task :deploy_dotfiles do
  home = ENV["HOME"]

  FileUtils.cp ".vimrc", File.join(home, ".vimrc")

  files = %w(profile load_rvm_environment build_rvm_environment)
  files.each do |file|
    source_profile_path = File.expand_path("../#{file}", __FILE__)
    target_path = File.join(home, "dotfiles_#{file}")
    unless File.file? target_path
      cmd = "ln -s #{source_profile_path} #{target_path}"
      raise "Unable to create symlink for profile: #{cmd}" unless system(cmd)
    end
  end

  possible_profile_files = %w(
    .profile
    .bash_profile
    .bashrc
    .zlogin
    .zshrc
  )

  possible_profile_files.each do |profile_file|
		profile_file = File.join(home, profile_file)
    next unless File.file? profile_file
		puts "Adding profile call to #{profile_file}"
    cmd ="echo 'source ~/dotfiles_profile' >> #{profile_file}"
    raise "Could not configure profile: #{cmd}" unless system(cmd)
  end

  puts "Now relogin or run: $ source ~/dotfiles_profile"
end

