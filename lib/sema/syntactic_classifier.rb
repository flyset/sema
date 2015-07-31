#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

class SyntacticClassifier

	# Classify if our word is a
	# noun, verb, adjective, adverb, 
	# pronoun, preposition, conjunction,
	# determiner, exclamation
	
	def classify(word)

		begin
			# Format
			downcase_word = word.downcase

			# Identify Special Classifications
			if downcase_word.to_i.to_s == downcase_word
				return "number"
			end

			# Identify Classifications
			basic_word = BasicWord.where(formatted_word: downcase_word).first

			if basic_word.nil?

				# Stemm
				stemmer= Lingua::Stemmer.new(:language => "en")
				stemmed_word = stemmer.stem(downcase_word)

				# Identify stem word
				stemmed_unclassified_word = StemmedWord.where(stemmed_word: stemmed_word)

				# Return nothing if we do not know the stem word
				return nil if stemmed_unclassified_word.count == 0

				# Identify Classification
				for stemmed_word_classification in stemmed_unclassified_word.first.classifications.to_a
					return stemmed_word_classification.classification if stemmed_word_classification.formatted_word == downcase_word
				end

				# Can not classify the word
				return "unclassified" unless stemmed_unclassified_word.count == 0
			else
				return basic_word.classification
			end
		rescue Exception => e

			puts "\nGuru meditation error: #{downcase_word}"
			puts e.message  
  			puts e.backtrace.inspect
  			exit
		end

		return nil
	end

end