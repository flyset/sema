#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

require 'pp'

# Load bootstrap
require "#{Dir.pwd}/lib/sema"

# TEXT
input_text = "Eusèbe Jaojoby (born 29 July 1955), commonly known by his surname Jaojoby, is a composer and singer of salegy, a musical style of northwestern Madagascar. Critics consider him to be one of the originators of the modern salegy style that emerged in the 1970s, and credit him with transforming the genre from an obscure regional musical tradition into one of national and international popularity. Jaojoby also contributed to the creation of two salegy subgenres, malessa and baoenjy. Jaojoby has been called the most popular singer in Madagascar and the Indian Ocean islands, and is widely referred to as the \"King of Salegy\". His success has earned him such honors as Artist of the Year in Madagascar for two consecutive years (1998–1999) and the role of Goodwill Ambassador for the United Nations Population Fund in 1999."

# Instatiate Semantic Extractor
sema = SemanticExtractor.new
sema.extract(input_text)

# Debugging

puts
puts "Sentences: " + sema.sentences.count.to_s
puts "Words: " + sema.words.count.to_s

puts "======================="
puts

for sentence in sema.sentences
	
	for word in sema.sentence(sentence.position)

		t = 'unknown' if word.class.nil?
		t = word.class if word.class

		if word.punctuation.nil?
			print "[#{t} => #{word.text}]" + " "
		else
			print "[#{t} => #{word.text}]" + "[#{word.punctuation}] "
		end
	end
	print "\n"
	puts
end