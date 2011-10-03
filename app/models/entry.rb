class Entry < ActiveRecord::Base
  belongs_to :letter
  has_many :terms
  has_many :definitions
end
