class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :definition_id
      t.string :name

      t.timestamps
    end
  end
end
