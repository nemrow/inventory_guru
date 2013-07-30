class CreateOrderDays < ActiveRecord::Migration
  def change
    create_table :order_days do |t|
      t.string :order_day
      t.integer :delivery_duration
      t.integer :supplier_id

      t.timestamps
    end
  end
end
