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
input_text = "Greg works in a bank. He goes to work at 9:00 am."

# Instatiate Semantic Extractor
sema = SemanticExtractor.new
sema.load(input_text)
sema.extract

# Debugging

pp sema