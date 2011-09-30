class CreateOrths < ActiveRecord::Migration
  def self.up
    create_table :orths do |t|
      t.string :name
      t.integer :entry_id
      t.integer :column
      t.integer :line

      t.timestamps
    end
  end

  def self.down
    drop_table :orths
  end
end
