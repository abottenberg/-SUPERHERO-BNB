class AddUserIdAsForeignKeyToSuper < ActiveRecord::Migration[6.0]
  def change
    add_reference :supers, :user, foreign_key: true
  end
end
