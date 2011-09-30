class CreateDefinitions < ActiveRecord::Migration
  def self.up
    create_table :definitions do |t|
      t.integer :term_id
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :definitions
  end
end
