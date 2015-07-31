#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

class Learn

	attr_accessor :learned_word

	def new_word(raw_word)

		# Format
		downcase_word = raw_word.downcase

		# Stemm
		stemmer= Lingua::Stemmer.new(:language => "en")
		stem_word = stemmer.stem(downcase_word)

		# Save word
		@learned_word = StemmedWord.new
		@learned_word.stemmed_word = stem_word
		@learned_word.save!
	end

	def new_classification(stem_word, raw_word, classification)

		# Get stem word
		@learned_word = StemmedWord.where(stemmed_word: stem_word).first

		# Format
		downcase_word = raw_word.downcase

		# Create a new classification
		new_classification = Classification.new
		new_classification.formatted_word = downcase_word
		new_classification.classification = classification
		@learned_word.classifications << new_classification
		@learned_word
	end

end