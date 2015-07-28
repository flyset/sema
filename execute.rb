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
require "#{Dir.pwd}/libs/bootstrap"

# TEXT
input_text = "The Boeing B-17 Flying Fortress is a four-engine heavy bomber aircraft developed in the 1930s for the United States Army Air Corps (USAAC). Competing against Douglas and Martin for a contract to build 200 bombers, the Boeing entry outperformed both competitors and exceeded the air corps' expectations. Although Boeing lost the contract because the prototype crashed, the air corps was so impressed with Boeing's design that they ordered 13 more B-17s for further evaluation. From its introduction in 1938, the B-17 Flying Fortress evolved through numerous design advances.[5][6]"

# Instatiate Semantic Extractor
sema = SemanticExtractor.new
sema.extract(input_text)

# Debugging
puts "Sentences: " + sema.sentences.count.to_s
puts "Words: " + sema.words.count.to_s

puts "======================="

for word in sema.words
	if word.punctuation.nil?
		print word.text + " "
	else
		print word.text + "[#{word.punctuation}] "
	end
end
print "\n"