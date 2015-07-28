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

	# Extract sentences segments
	# Heuristic Method
	def extract(text)
		
		parts = text.split(" ")
		sentence_position = 0
		@words = Array.new
		@sentences = Array.new

		for part in parts

			# Conditions
			if part.reverse[0] == '.' or part.reverse[0] == '?' or part.reverse[0] == '!'

				# Process punctuation marks
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
				@words << create_word(formatted_part, sentence_position, parts.index(part), nil, punctuation)

				# Create sentence
				@sentences << create_sentence(sentence_position, punctuation)
				sentence_position = sentence_position + 1
			else
				# Process punctuation marks
				case part.reverse[0]
				when ','
					punctuation = ','
					formatted_part = part[0...-1]
				else
					punctuation = nil
					formatted_part = part
				end

				# Create word
				@words << create_word(formatted_part, sentence_position, parts.index(part), nil, punctuation)
			end
		end
	end

	private

	# Create word
	def create_word(text, sentence_position, position, type, punctuation)
		word = Word.new
		word.text = text
		word.sentence_position = sentence_position
		word.position = position
		word.type = type
		word.punctuation = punctuation
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