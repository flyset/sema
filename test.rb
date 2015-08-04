require 'irb'

# Syntactic.rb

# The interface for syntax tools
module Syntactic

	def down
		d = Do.new
		@text_downcase = d.do_down(text)
	end

	class Do

		def initialize
			puts "Getting initialized."
		end

		def do_down(text)
			text.downcase
		end

	end

end

module Extractor

	def extract_syntax
		pp "Extracting.."
	end

end

module BatchJobs
end

# Semantic.rb

# This will be mainly the interface
class Semantic

	include Syntactic
	include Extractor

	attr_accessor :text, :text_downcase, :words, :sentences

	def initialize(text)
		@text = text
	end

end

# Main.rb



IRB.setup nil
IRB.conf[:MAIN_CONTEXT] = IRB::Irb.new.context
require 'irb/ext/multi-irb'
IRB.irb nil, self