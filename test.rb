require 'irb'

module Syntactic

	def down
		@text_downcase = text.downcase
	end

end

module Extractor

	def extract
		pp "Extracting.."
	end

end


class Semantic

	include Syntactic
	include Extractor

	attr_accessor :text, :text_downcase, :words, :sentences

	def initialize(text)
		@text = text
	end

end

IRB.setup nil
IRB.conf[:MAIN_CONTEXT] = IRB::Irb.new.context
require 'irb/ext/multi-irb'
IRB.irb nil, self