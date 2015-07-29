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

		# Format
		downcase_word = word.downcase

		# Stemm
		formatted_word = downcase_word.stem

		# Identify word classification
		classified_word = Classification.where(formatted_word: formatted_word).first

		# DEBUG
		#if not classified_word.nil?
		#	print "[ original = #{downcase_word} ] => [ stem = #{formatted_word} ] => [ #{classified_word.classification} ]\n"
		#end

		classified_word.classification unless classified_word.nil?
	end

end