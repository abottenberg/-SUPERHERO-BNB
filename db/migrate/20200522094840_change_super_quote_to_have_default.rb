class ChangeSuperQuoteToHaveDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :supers, :quote, :string, default: "Let's go!"
  end
end
