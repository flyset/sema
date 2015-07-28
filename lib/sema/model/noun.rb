#
# This file is part of "sema".
#
# (c) Konstantinos Gerodimos <kosta@gerodimos.com>
#
# This source file is subject to the Apache License that is bundled
# with this source code in the file LICENSE.
#

class Noun
  include Mongoid::Document
  field :formatted_word
end

## DEMO

# class Show
#   include Mongoid::Document
#   include Mongoid::Timestamps
#   field :date # as created on
#   field :import_id # deprecate this
#   field :play_count # custom field
#   field :prevent_embed # custom field
#   field :published # deprecate this
#   field :tags # deprecate this # vielleicht als category
#   field :allow_download
#   # id # reference_id

#   embeds_one :permission
#   embeds_many :translations

#   has_many :segments
#   has_many :videos
# end

# class Translation
#   include Mongoid::Document
#   include Mongoid::Timestamps
#   field :description # description
#   field :image_url # thumbnail
#   field :locale # tags
#   field :meta_description # nil
#   field :meta_title # nil
#   field :teaser # teaser (custom field)
#   field :thumbnail # deprecate this
#   field :title # title

# end

# class Permission
#   include Mongoid::Document
#   field :career_level # custom field
#   field :has_cashback_card # custom field
#   field :has_position # custom field
#   field :is_business_member # custom field
#   field :is_cashback_club_member # custom field
# end

# class Segment
#   include Mongoid::Document
#   include Mongoid::Timestamps
#   field :show_id
#   field :date # as created on
#   field :import_id # deprecate this
#   field :play_count # custom field
#   field :published # deprecate this
#   field :tags # deprecate this # vielleicht als category

#   embeds_one :permission
#   embeds_many :translations

#   belongs_to :show
# end

# class Video
#   include Mongoid::Document
#   include Mongoid::Timestamps
#   field :preview_time
#   field :filename
#   field :transcoding_id
#   field :show_id
#   field :import_id
#   field :locale

#   embeds_many :sources
#   embeds_many :segment_timings
#   belongs_to :show
# end

# class Source
#   include Mongoid::Document
#   field :filename
#   field :cdn
#   field :format
# end

# class SegmentTiming
#   include Mongoid::Document
#   field :start
#   field :end
#   field :segment_id
#   field :sort_index

#   belongs_to :segment
# end