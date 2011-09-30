class Term < ActiveRecord::Base
  has_many :definitions
  has_many :orths
end
