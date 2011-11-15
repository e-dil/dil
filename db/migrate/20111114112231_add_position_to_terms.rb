class AddPositionToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :position, :integer
  end
end
