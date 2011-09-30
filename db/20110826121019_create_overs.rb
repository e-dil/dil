class CreateOvers < ActiveRecord::Migration
  def self.up
    create_table :overs do |t|
      t.string :name
      t.integer :entry_id
      t.timestamps
    end
  end

  def self.down
    drop_table :overs
  end
end
