#
# This file is part of the "nunguku" framework.
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

class SemanticExtractor

	def load(text)
		@input_text = text
	end

	def extract

		# Extract Syntax
		syntactic_extractor = SyntacticExtractor.new
		syntactic_extractor.load(@input_text)
		syntactic_extractor.extract

		# assign
		@sentences = syntactic_extractor.sentences
		@words = syntactic_extractor.words
	end

end