class Orth < ActiveRecord::Base
  belongs_to :term
  belongs_to :entry
end
