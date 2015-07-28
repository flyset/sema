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

	# Extract words and sentences
	# via a heuristic method
	def extract(text)
		
		parts = text.split(" ")
		sentence_position = 0
		@words = Array.new
		@sentences = Array.new

		for part in parts

			# Pre-process none words

			# Process structure
			if part.reverse[0] == '.' or part.reverse[0] == '?' or part.reverse[0] == '!'

				# Process sentence punctuation marks
				# at the end of a word
				case part.reverse[0]
				when '.'
					punctuation = '.'
				when '?'
					punctuation = '?'
				when '!'
					punctuation = '!'
				end

				# Process and create last word
				formatted_part = part[0...-1]
				@words << create_word(formatted_part, sentence_position, parts.index(part), punctuation)

				# Create sentence
				@sentences << create_sentence(sentence_position, punctuation)
				sentence_position = sentence_position + 1
			else

				# Process punctuation marks
				# at the end of a word
				case part.reverse[0]
				when ','
					punctuation = ','
					formatted_part = part[0...-1]
				else
					punctuation = nil
					formatted_part = part
				end

				# Create word
				@words << create_word(formatted_part, sentence_position, parts.index(part), punctuation)
			end
		end
	end

	def get_sentence(position)
		words = Array.new
		for word in @words
			words << word if word.sentence_position == position
		end
		words
	end

	private

	# Create word
	def create_word(text, sentence_position, position, punctuation)
		word = Word.new
		word.text = text
		word.sentence_position = sentence_position
		word.position = position
		word.punctuation = punctuation
		word.classify
		word
	end

	# Create sentence
	def create_sentence(sentence_position, type)
		sentence = Sentence.new
		sentence.position = sentence_position
		sentence.type = type
		sentence
	end

end