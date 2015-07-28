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

	def extract(text)
		@input_text = text
		extract_sentences
		extract_words
	end

	# Extract sentences segments
	def extract_sentences
		@sentences = Array.new
		sentences = @input_text.split(".")
		for sentence_text in sentences
			sentence = Sentence.new
			sentence.text = sentence_text
			sentence.position = sentences.index(sentence_text)
			sentence.type = nil
			@sentences << sentence
		end
	end

	# Extract words segments
	def extract_words
		@words = Array.new
		for sentence in @sentences
			words = sentence.text.split(" ")
			for word_text in words
				word = Word.new
				word.text = word_text
				word.sentence = @sentences.index(sentence)
				word.position = words.index(word_text)
				word.type = nil
				@words << word
			end
		end
	end

end