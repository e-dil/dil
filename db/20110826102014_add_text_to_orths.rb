class AddTextToOrths < ActiveRecord::Migration
  def self.up
    add_column :orths, :text, :text
  end

  def self.down
    remove_column :orths, :text
  end
end
