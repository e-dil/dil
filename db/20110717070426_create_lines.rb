class CreateLines < ActiveRecord::Migration
  def self.up
    create_table :lines do |t|
      t.integer :num
      t.integer :column_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lines
  end
end
