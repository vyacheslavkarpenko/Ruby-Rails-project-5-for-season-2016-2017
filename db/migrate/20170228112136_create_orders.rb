class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :restaurant
      t.boolean    :complete, :default => false

      t.timestamps
    end
  end
end
