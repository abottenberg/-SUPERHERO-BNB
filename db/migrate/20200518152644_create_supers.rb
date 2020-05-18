class CreateSupers < ActiveRecord::Migration[6.0]
  def change
    create_table :supers do |t|
      t.string :name
      t.string :location
      t.boolean :good, default: true

      t.timestamps
    end
  end
end
