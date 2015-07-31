#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

class StemmedWord
	include Mongoid::Document
  	field :stemmed_word
  	embeds_many :classifications
end

class Classification
	include Mongoid::Document
  	field :formatted_word
  	field :classification
  	embedded_in :stemmed_words
end