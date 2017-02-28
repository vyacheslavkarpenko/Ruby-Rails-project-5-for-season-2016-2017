class CreateOrdersDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_dishes do |t|
      t.belongs_to :order
      t.belongs_to :dish

      t.timestamps
    end
  end
end
