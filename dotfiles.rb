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

	def self.deploy( dotfile, overwrite )
		source_path = File.expand_path( "../#{dotfile}", __FILE__ ) 
		target_path = File.join( Dotfiles.home, "#{dotfile}" ) 

		preexisting_file = File.file? target_path

		# TODO: add a vimdiff?
		if preexisting_file && ! overwrite
			puts "Warning: target dotfile exists: #{target_path}".red
			puts "Overwrite by adding OVERWRITE=1"
		else
			system("vimdiff #{source_path} #{target_path}")
			FileUtils.cp source_path, target_path
			puts "#{target_path} deployed".green
		end
	end
end


