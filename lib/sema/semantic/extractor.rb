#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

module Semantic

	class Extractor < Interface

		def initialize(text)
			extract(text)
		end

		# Semantic Extractor
		def extract(text)
			
			# Extract syntax
			@syntactic = Syntactic::Extractor.new(text)
		end

	end

end