#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

# 3rd Party
require 'pp'
require 'mongoid'
require 'action_view'
require 'active_support'
require 'yaml'
require 'lingua/stemmer'
require 'benchmark'

# Local 3rd Party
#require "#{Dir.pwd}/lib/sema/stemmify"

# Modules & libs
require "#{Dir.pwd}/lib/sema/semantic"
require "#{Dir.pwd}/lib/sema/semantic/extractor"
require "#{Dir.pwd}/lib/sema/semantic/sentence"
require "#{Dir.pwd}/lib/sema/semantic/word"

require "#{Dir.pwd}/lib/sema/syntactic"
require "#{Dir.pwd}/lib/sema/syntactic/extractor"
require "#{Dir.pwd}/lib/sema/syntactic/classifier"

# Models
require "#{Dir.pwd}/lib/sema/models/basic_word"
require "#{Dir.pwd}/lib/sema/models/stemmed_word"

# MongoDB
Mongoid.load!("#{Dir.pwd}/config/mongoid.yml", :production)