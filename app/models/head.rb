class Head < ActiveRecord::Base
  has_many :columns
  has_many :lines, :through => :columns
  has_many :entries
end
