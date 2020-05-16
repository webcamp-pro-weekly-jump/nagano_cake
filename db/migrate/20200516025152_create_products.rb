class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string  :name
      t.string  :image_id
      t.text	:introduction
      t.integer :price
      t.boolean :is_sale
      t.timestamps
    end
  end
end
