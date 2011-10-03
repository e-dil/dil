class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :letter_id
      t.timestamps
    end

    create_table :definitions do |t|
      t.text :text
      t.string :kind
      t.integer :entry_id
      t.integer :part_id
      t.timestamps
    end

    create_table :letters do |t|
      t.string :name
      t.timestamps
    end

    create_table :words do |t|
      t.string :name
      t.integer :entry_id
      t.timestamps
    end

    create_table :terms do |t|
      t.string :name
      t.integer :word_id
      t.integer :entry_id
      t.timestamps
    end

    create_table :part do |t|
      t.string :name
      t.timestamps
    end
  end
end
