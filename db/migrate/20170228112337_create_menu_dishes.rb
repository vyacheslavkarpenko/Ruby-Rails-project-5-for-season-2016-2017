class CreateMenuDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_dishes do |t|
      t.belongs_to :menu
      t.belongs_to :dish

      t.timestamps
    end
  end
end
