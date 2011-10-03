class CreatePartOfSpeeches < ActiveRecord::Migration
  def change
    create_table :part_of_speeches do |t|
      t.string :name

      t.timestamps
    end

    add_column :definitions, :part_of_speech_id, :integer
  end
end
