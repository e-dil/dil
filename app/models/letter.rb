class Letter < ActiveRecord::Base
  has_many :entries
  has_many :terms, :through => :entries
  has_many :words, :through => :terms
end
