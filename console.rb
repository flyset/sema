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

def extract(input_text)
	# Instatiate Semantic Extractor
	@sema = SemanticExtractor.new
	@sema.extract(input_text)

	puts
	puts "======================="
	puts "Sentences: " + @sema.sentences.count.to_s
	puts "Words: " + @sema.words.count.to_s
	puts "======================="
	puts

	for sentence in @sema.sentences
		
		for word in @sema.sentence(sentence.position)

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
end

def version
	puts
	puts "SEMA v1.0 pre-alpha"
	puts
end

version

loop do
  ('sema %> ').display
  input = gets.chomp
  command, *params = input.split /\s/
  case command
    when 'help'

      	puts "Commands: help, exit, version, read, load, stem, plural, find"

    when 'exit'

    	exit

    when 'version'

    	version

    when 'read'

    	('input text : ').display
    	input_text = gets.chomp
      	extract(input_text)

    when 'load'

      	input_text = File.open("#{Dir.pwd}/input.txt").read
      	extract(input_text)

    when 'stem'

    	puts params.first.stem

    when 'plural'

    	puts params.first.pluralize

    when 'singular'

    	puts params.first.singularize

    when 'find'

    	word = Classification.where(formatted_word: params.first).first
    	pp word unless word.nil?

    when 'list'

    	pp @sema.words

    else
      	
      	puts 'Invalid command'

  end
end