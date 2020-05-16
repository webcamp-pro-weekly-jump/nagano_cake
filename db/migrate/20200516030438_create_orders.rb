class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :member_id
      t.string :postal_code
      t.string :address
      t.integer :pay_method
      t.integer :all_price
      t.integer :order_status
      t.integer :postage

      t.timestamps
    end
  end
end
