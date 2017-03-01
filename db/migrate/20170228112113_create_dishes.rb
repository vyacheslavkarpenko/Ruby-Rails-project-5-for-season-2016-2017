class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string  :name
      t.text    :description
      t.integer :price
      t.integer :weight
      t.string  :picture

      t.timestamps
    end
  end
end
