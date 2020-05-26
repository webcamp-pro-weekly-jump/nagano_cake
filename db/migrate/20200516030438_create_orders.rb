class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.integer :member_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :pay_method, null: false, default: 0
      t.integer :all_price, null: false
      t.integer :order_status, null: false, default: 0
      t.integer :postage, null: false, default: 800

      t.timestamps
    end
  end
end
