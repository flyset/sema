#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

# 3rd Party
require 'mongoid'
require 'action_view'
require 'active_support'
require 'yaml'

# 3rd Party
require "#{Dir.pwd}/lib/sema/stemmify"

# Libraries
require "#{Dir.pwd}/lib/sema/semantic_extractor"
require "#{Dir.pwd}/lib/sema/syntactic_extractor"
require "#{Dir.pwd}/lib/sema/syntactic_classifier"

# Objects
require "#{Dir.pwd}/lib/sema/object/sentence"
require "#{Dir.pwd}/lib/sema/object/word"

# MongoDB
Mongoid.load!("#{Dir.pwd}/config/mongoid.yml", :production)

# Models
require "#{Dir.pwd}/lib/sema/model/classification"