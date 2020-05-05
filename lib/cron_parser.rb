require_relative 'editor.rb'

class CronParser
	def self.display(editor = Editor.new)
		@config = STDIN.to_a
		@current_time = ARGV.first
		editor.get(@config, @current_time)
		editor.put
	end 
end

CronParser.display
