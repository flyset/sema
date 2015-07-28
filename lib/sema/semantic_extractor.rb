#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

class SemanticExtractor

	attr_accessor :raw_text

	# Semantic Extractor
	def extract(text)

		# Set default raw text
		@raw_text = text
		
		# Extract syntax
		@syntax = SyntacticExtractor.new
		@syntax.extract(@raw_text)
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