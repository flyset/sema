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

VERSION = "v1.0 pre-alpha"

def extract(input_text)
	# Instatiate Semantic Extractor
	@sema = SemanticExtractor.new
	@sema.extract(input_text)
end

def show_analysis
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

def show_text

  puts
  for sentence in @sema.sentences
    
    for word in @sema.sentence(sentence.position)

      t = 'unknown' if word.class.nil?
      t = word.class if word.class

      if word.punctuation.nil?
        print "#{word.text}" + " "
      else
        print "#{word.text}" + "[#{word.punctuation}] "
      end
    end
    print "\n"
    puts
  end
end

def show_input
  puts
  puts @input_text
  puts
end

def list_words

  puts
  for word in @sema.words
    puts "#{word.position} [#{word.text}], [#{word.class}]"
  end
  puts

end

def list_learn

  puts
  for word in @sema.words
    puts "#{word.position} [#{word.text}], [#{word.class}]" if word.class.nil?
  end
  puts

end

def version
	puts
	puts "SEMA #{VERSION}"
	puts
end

version

loop do
  ('sema %> ').display
  input = gets.chomp
  command, *params = input.split /\s/
  case command
    when 'help'

      puts
      puts "Commands: help, exit, version, read, load, show, stem, plural, find, list, learn, extract"
      puts

    when 'exit'

    	exit

    when 'version'

    	version

    when 'read'

      puts
    	('input text : ').display
    	@input_text = gets.chomp
      puts

    when 'load'

      @input_text = File.open("#{Dir.pwd}/input.txt").read
      show_input

    when 'extract'

      extract(@input_text)

    when 'show'

      case params.first
      when 'text'
        show_text
      when 'input'
        show_input
      else
        show_analysis
      end

    when 'stem'

      puts
      stemmer= Lingua::Stemmer.new(:language => "en")
      puts stemmer.stem(params.first)
      puts

    when 'stemmer'

      puts
      puts params.first.stem
      puts

    when 'plural'

      puts
    	puts params.first.pluralize
      puts

    when 'singular'

      puts
    	puts params.first.singularize
      puts

    when 'find'

      puts
    	word = Classification.where(formatted_word: params.first).first
    	pp word unless word.nil?
      puts

    when 'list'

      list_words

    when 'learn'

      list_learn

    else
      
      puts
      puts 'Invalid command'
      puts

  end
end