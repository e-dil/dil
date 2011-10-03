class CreateBibls < ActiveRecord::Migration
  def change
    create_table :bibls do |t|
      t.integer :definition_id
      t.string :code
      t.string :title
      t.string :scope

      t.timestamps
    end
  end
end
