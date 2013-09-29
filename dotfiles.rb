module Dotfiles
	def self.files
		[ 
			".profile", 
			".vimrc" 
		]
	end

	def self.home
		ENV["HOME"]
	end

	def self.deploy( dotfile )
		source_path = File.expand_path( "../#{dotfile}", __FILE__ ) 
		target_path = File.join( Dotfiles.home, "#{dotfile}" ) 

		overwrite_variable = "OVERWRITE_DOTFILES"
		overwrite_password = "yes" 
		overwrite_confirmed = ENV["OVERWRITE_DOTFILES"].to_s =~ /^#{overwrite_password}$/
		preexisting_file = File.file? target_path

		if preexisting_file && ! overwrite_confirmed
			puts "Warning: target dotfile exists: #{target_path}".red
			puts "Overwrite by running with #{overwrite_variable}=#{overwrite_confirmed}"
		else
			FileUtils.cp source_path, target_path
			puts "#{target_path} deployed".green
		end
	end
end


