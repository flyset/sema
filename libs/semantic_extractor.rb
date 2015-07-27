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