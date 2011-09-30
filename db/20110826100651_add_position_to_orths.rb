class AddPositionToOrths < ActiveRecord::Migration
  def self.up
    add_column :orths, :position, :integer
  end

  def self.down
    remove_column :orths, :position
  end
end
