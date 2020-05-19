class AddDescriptionColumnToSupers < ActiveRecord::Migration[6.0]
  def change
    add_column :supers, :description, :text
  end
end
