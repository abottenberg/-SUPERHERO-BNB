class AddQuoteColumnToSupers < ActiveRecord::Migration[6.0]
  def change
    add_column :supers, :quote, :string
  end
end
