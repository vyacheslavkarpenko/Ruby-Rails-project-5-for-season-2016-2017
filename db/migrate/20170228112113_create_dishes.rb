class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string  :name
      t.string  :description
      t.integer :price
      t.string  :picture

      t.timestamps
    end
  end
end
