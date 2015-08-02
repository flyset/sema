#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

module Syntactic

	class Classifier

		# Classify if our word is a
		# noun, verb, adjective, adverb, 
		# pronoun, preposition, conjunction,
		# determiner, exclamation
		
		def classify(word)

			begin
				# Format
				formatted_word = format_word(word)

				# Identify Special Classifications
				special_classification = special_word(formatted_word)
				return special_classification unless special_classification.nil?

				# Identify Classifications
				return identify_classification(formatted_word)

			rescue Exception => e

				puts "\nGuru meditation error: #{formatted_word}"
				puts e.message  
	  			puts e.backtrace.inspect
	  			exit
			end

			return nil
		end

		def format_word(word)
			
			# Make downcase
			formatted_word = word.downcase
			return formatted_word
		end

		def special_word(word)
			
			# Identify Numerical
			if word.to_i.to_s == word
				return "number"
			end
		end

		def identify_classification(word)
			
			# Find Basic Word Classification
			basic_word = Find.basic(word).first

			if basic_word.nil?

				# Stemm
				stemmed_word = Stem.word(word)

				# Find stem word
				stemmed_unclassified_word = Find.stem(stemmed_word)

				# Return nothing if we do not know the stem word
				return nil if stemmed_unclassified_word.count == 0

				# Identify Classification
				for stemmed_word_classification in stemmed_unclassified_word.first.classifications.to_a
					return stemmed_word_classification.classification if stemmed_word_classification.formatted_word == word
				end

				# Can not classify the word
				return "unclassified" unless stemmed_unclassified_word.count == 0
			else
				return basic_word.classification
			end
		end

	end
end