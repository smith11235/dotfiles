require 'fileutils'
require 'yaml'

desc "Setup all config files and profiles"
task :deploy_dotfiles do
  overwrite = ENV["OVERWRITE"] # will either be nil or something

  FileUtils.cp ".vimrc", "~/.vimrc"

  possible_profile_files = %w(
    .profile
    .bash_profile
    .bashrc
    .zlogin
    .zshrc
  )

  profile_files.each do |profile_file|
		profile_file = File.join ENV["HOME"], profile_file
    next unless File.file? profile_file
		puts "Adding profile to #{profile_file}"
    cmd ="echo 'source ~/git/dotfiles/.profile' >> #{profile_file}"
    raise "Could not add to #{profile_file}" unless system(cmd)
  end

  puts "Now run: $ source ~/git/dotfiles/.profile"
end

