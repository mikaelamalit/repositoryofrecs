class Rec < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :tags
  belongs_to :user
	has_many :tags
end
