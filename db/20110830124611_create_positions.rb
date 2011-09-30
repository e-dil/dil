class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.string :letter, :limit => 1
      t.integer :line
      t.integer :column
      t.timestamps
    end
  end

  def self.down
    drop_table :positions
  end
end
