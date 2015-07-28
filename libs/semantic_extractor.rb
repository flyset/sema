#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

class SemanticExtractor

	# Semantic Extractor
	def extract(text)
		@input_text = text
		extract_syntax
	end

	# Extract Syntax
	def extract_syntax
		@syntax = SyntacticExtractor.new
		@syntax.extract(@input_text)
	end

end