class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date
      t.date :delivery_date
      t.integer :quantity
      t.integer :product_id
      t.integer :supplier_id

      t.timestamps
    end
  end
end
