#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

module Syntactic

	class Extractor

		attr_accessor :sentences, :words, :text

		def initialize(text)
			@text = text and extract
		end

		# Extract words and sentences
		# via a heuristic method
		def extract
			
			# Seperates the text in parts by space
			parts = @text.split(" ")
			
			# Set parameters
			sentence_position = 0
			@words = Array.new
			@sentences = Array.new

			for part in parts

				# Which seperates a sentence
				punctuation_pattern = /\.+|\?+|\!+/

				# Process structure
				if part.reverse[0] =~ punctuation_pattern

					# Process sentence punctuation marks
					# at the back of a part
					case part.reverse[0]
					when '.'
						back_punctuation = '.'
					when '?'
						back_punctuation = '?'
					when '!'
						back_punctuation = '!'
					when ';'
						back_punctuation = ';'
					when ':'
						back_punctuation = ':'
					end

					# Process and Create last word
					formatted_part = part.sub!(punctuation_pattern, '')
					classification = Classifier.new(formatted_part).classification
					@words << create_word(
						formatted_part, 
						sentence_position, 
						parts.index(part), 
						nil, 
						back_punctuation, 
						classification
					)

					# Create sentence
					@sentences << create_sentence(
						sentence_position, 
						back_punctuation
					)
					sentence_position = sentence_position + 1
				else

					# Process punctuation marks
					# in front of a word
					case part[0]
					when '('
						front_punctuation = '('
						part[0] = ''
					when '"'
						front_punctuation = '"'
						part[0] = ''
					else
						front_punctuation = nil
					end


					# Process punctuation marks
					# at the back of a word
					case part.reverse[0]
					when ','
						back_punctuation = ','
						formatted_part = part[0...-1]
					when ':'
						back_punctuation = ':'
						formatted_part = part[0...-1]
					when ';'
						back_punctuation = ';'
						formatted_part = part[0...-1]
					when ')'
						back_punctuation = ')'
						formatted_part = part[0...-1]
					when '"'
						back_punctuation = '"'
						formatted_part = part[0...-1]
					else
						back_punctuation = nil
						formatted_part = part
					end

					# Create word
					classification = Classifier.new(formatted_part).classification
					@words << create_word(
						formatted_part, 
						sentence_position, 
						parts.index(part), 
						front_punctuation, 
						back_punctuation, 
						classification
					)
				end
			end
		end

		# Returns sentence by position
		def get_sentence(position)
			words = Array.new
			for word in @words
				words << word if word.sentence_position == position
			end
			words
		end

		private

		# Create a new word
		def create_word(text, sentence_position, position, front_punctuation, back_punctuation, classification)
			word = Semantic::Word.new
			word.text = text
			word.sentence_position = sentence_position
			word.position = position
			word.front_punctuation = front_punctuation
			word.back_punctuation = back_punctuation
			word.class = classification

			return word
		end

		# Create a new sentence
		def create_sentence(sentence_position, type)
			sentence = Semantic::Sentence.new
			sentence.position = sentence_position
			sentence.type = type

			return sentence
		end

	end

end