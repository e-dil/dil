class CreateColumns < ActiveRecord::Migration
  def self.up
    create_table :columns do |t|
      t.integer :num
      t.integer :head_id

      t.timestamps
    end
  end

  def self.down
    drop_table :columns
  end
end
