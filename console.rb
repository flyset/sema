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
input_text = "I have a blue car."

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