class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :head_id
      t.integer :col
      t.integer :line
      t.integer :order
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
