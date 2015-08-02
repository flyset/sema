#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

module Syntactic
	
	# Find words from the mongodb
	class Find

		def self.stem(string)
			StemmedWord.where(stemmed_word: string)
		end

		def self.basic(string)
			BasicWord.where(formatted_word: string)
		end
	end

	# Stem methods
	class Stem

		def self.word(string)
			s = Lingua::Stemmer.new(:language => "en")
			stemmed_word = s.stem(string)
			return stemmed_word
		end
	end

	# Learn methods
	class Learn

		def self.word(word)

			# Format
			downcase_word = word.downcase

			# Stemm
			stem_word = Stem.word(downcase_word)

			# Save word
			learned_word = StemmedWord.new
			learned_word.stemmed_word = stem_word
			learned_word.save!

			return true
		end

		def self.classification(stem_word, word, classification)

			# Get stem word
			learned_word = Find.stem(stem_word).first

			# Format
			downcase_word = word.downcase

			# Create a new classification
			new_classification = Classification.new
			new_classification.formatted_word = downcase_word
			new_classification.classification = classification
			learned_word.classifications << new_classification
			
			return learned_word
		end

	end

	class Unlearn

		def self.by_id(id)
			found = StemmedWord.where( _id: id )
			found.first.remove unless found.first.nil?
		end

	end

end