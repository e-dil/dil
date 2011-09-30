class Column < ActiveRecord::Base
  belongs_to :head
  has_many :lines
end
