class PartOfSpeech < ActiveRecord::Base
  has_many :definitions 
end
