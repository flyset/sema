require 'pp'
require 'mongoid'
require 'action_view'

# MongoDB
Mongoid.load!("#{Dir.pwd}/../../config/mongoid.yml", :production)

# Models
require "#{Dir.pwd}/../../lib/sema/model/stemmed_word"

StemmedWord.all.each do |stemmed_word|

	stem = stemmed_word.stemmed_word

	words = StemmedWord.where(stemmed_word: stem).to_a

	if words.count > 1

		puts "connecting ... #{stem}"
		
		new_word = StemmedWord.new
		new_word.stemmed_word = stem

		for word in words
			new_word.classifications << word.classifications.first
			word.delete
		end

		new_word.save!
	end

end