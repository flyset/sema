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
		test = Noun.find("55b79f2b49978b1972103b72")

		puts test.formatted_word
		exit
	end

end