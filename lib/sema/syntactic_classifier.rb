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
			formatted_word = format_word(word)

			# Identify Special Classifications
			special_classification = special_word(formatted_word)
			return special_classification unless special_classification.nil?

			# Identify Classifications
			return identify_word(formatted_word)

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

	def identify_word(word)
		
		# Identify Classifications
		basic_word = BasicWord.where(formatted_word: word).first

		if basic_word.nil?

			# Stemm
			stemmer= Lingua::Stemmer.new(:language => "en")
			stemmed_word = stemmer.stem(word)

			# Identify stem word
			stemmed_unclassified_word = StemmedWord.where(stemmed_word: stemmed_word)

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