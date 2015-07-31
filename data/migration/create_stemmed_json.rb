require 'lingua/stemmer'
require 'pp'

File.open("#{Dir.pwd}/"+ ARGV[0], "r").each_line do |line|
  
  word = line.sub!(/\n/, '')

  stemmer= Lingua::Stemmer.new(:language => "en")
  stemmed_word = stemmer.stem(word)

  puts "{ stemmed_word: \"#{stemmed_word}\", classifications: [ { formatted_word: \"#{word}\", classification: \"#{ARGV[1]}\" } ] }" if word

end