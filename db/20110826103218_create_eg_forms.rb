class CreateEgForms < ActiveRecord::Migration
  def self.up
    create_table :eg_forms do |t|
      t.text :text
      t.integer :entry_id

      t.timestamps
    end
  end

  def self.down
    drop_table :eg_forms
  end
end
