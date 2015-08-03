#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

module Pattern

	# Mainly accessed by Semantic::Extractor
	class Interface
		attr_accessor :pattern_str

	end

	class Extractor < Interface

		def initialize(syntactic)
			@syntactic = syntactic
			extract
		end

		def extract

			@pattern_str = String.new
			for word in @syntactic.words
				@pattern_str << "[#{word.class[0...2]}]" unless word.class.nil?
			end

		end

	end

end