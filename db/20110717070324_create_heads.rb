class CreateHeads < ActiveRecord::Migration
  def self.up
    create_table :heads do |t|
      t.string :letter

      t.timestamps
    end
  end

  def self.down
    drop_table :heads
  end
end
