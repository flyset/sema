#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

class Word
	attr_accessor :text, :sentence_position, :position, :class, :punctuation

	def classify
		classifier = SyntacticClassifier.new
		self.class = classifier.classify(@text)
	end
end