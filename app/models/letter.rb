class Letter < ActiveRecord::Base
  has_many :entries
  has_many :terms, :through => :entries
  has_many :words, :through => :terms

  validates :name, :presence => true, :length => {:minumum => 1, :maximum => 1}
end
