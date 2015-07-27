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

		normalized_text = @input_text

		# Extract sentences segments
		@sentences = normalized_text.split(".")

		# Extract words segments
		@words = Array.new
		for sentence in @sentences
			@words<< { @sentences.index(sentence) => sentence.split(" ") }
		end

	end

end