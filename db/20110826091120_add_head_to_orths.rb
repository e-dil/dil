class AddHeadToOrths < ActiveRecord::Migration
  def self.up
    add_column :orths, :head, :string
  end

  def self.down
    remove_column :orths, :head
  end
end
