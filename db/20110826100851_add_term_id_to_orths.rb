class AddTermIdToOrths < ActiveRecord::Migration
  def self.up
    add_column :orths, :term_id, :integer
  end

  def self.down
    remove_column :orths, :term_id
  end
end
