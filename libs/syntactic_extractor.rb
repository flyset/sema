#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

class SyntacticExtractor

	attr_accessor :sentences, :words

	def load(text)
		@input_text = text
	end

	def extract
		extract_sentences
		extract_words
	end

	# Extract sentences segments
	def extract_sentences
		@sentences = @input_text.split(".")
	end

	# Extract words segments
	def extract_words
		@words = Array.new
		for sentence in @sentences
			words = sentence.split(" ")
			for word in words
				#word = Word.new
				@words<< { :text => word, 
						   :sentence => @sentences.index(sentence),
						   :position => words.index(word),
						   :type => nil }
			end
		end
	end

end