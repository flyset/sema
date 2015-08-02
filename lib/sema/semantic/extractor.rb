#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

module Semantic

	class Extractor

		attr_accessor :raw_text

		def initialize(text)
			@raw_text = text and extract
		end

		# Semantic Extractor
		def extract
			
			# Extract syntax
			@syntax = Syntactic::Extractor.new(@raw_text)

		end

		# Interface methods for commandline (execute)
		def sentences
			@syntax.sentences
		end

		def words
			@syntax.words
		end

		def sentence(position)
			@syntax.get_sentence(position)
		end

	end

end