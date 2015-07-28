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

		# Format and stemm word
		formatted_word = word.downcase

		# Identify word classification
		classified_word = Classification.where(formatted_word: formatted_word).first
		classified_word.classification unless classified_word.nil?
	end

end