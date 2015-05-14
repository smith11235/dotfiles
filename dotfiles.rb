require 'fileutils'
require 'yaml'

class Dotfiles
  def initialize
    %w(.vimrc .gemrc).each do |file_name|
      symlink(file_name, file_name)
    end

    files = %w(profile load_rvm_environment build_rvm_environment)
    files.each do |file|
      symlink(file, "dotfiles_#{file}")
    end

    extend_profile_files
  end

  private

  def home
    @home ||= ENV["HOME"]
  end

  def common_profile_files
    %w(
    .profile
    .bash_profile
    .bashrc
    .zlogin
    .zshrc
    )
  end

  def extend_profile_files
    common_profile_files.each do |profile_file_name|
      profile_file = home_file(profile_file_name)
      next unless File.file? profile_file
      cmd ="echo 'source ~/dotfiles_profile' >> #{profile_file}"
      raise "Could not configure profile: #{cmd}" unless system(cmd)
    end

    puts "Now relogin or run: $ source ~/dotfiles_profile"
  end

  def home_file(file_name)
    File.join(home, file_name)
  end

  def source_file(file_name)
    File.expand_path("../#{file_name}", __FILE__)
  end

  def symlink(source_file_name, target_file)
    source_path = source_file(source_file_name)
    target_path = home_file(target_file)

    raise "Missing source file: #{source_path}" unless File.file? source_path
    FileUtils.rm target_path if File.file? target_path
    cmd = "ln -s #{source_path} #{target_path}"
    raise "Unable to create symlink for profile: #{cmd}" unless system(cmd)
  end

end

Dotfiles.new

