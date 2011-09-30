class Entry < ActiveRecord::Base
  belongs_to :head
  has_many :eg_forms
  has_one :orth
  has_many :overs

  def self.get_column(head, col = 1)
    where("text LIKE '%<br column=\"?\"%'", col).
    where("head_id = ?", head)
  end
end
