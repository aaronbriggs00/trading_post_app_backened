class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.boolean :price_negotiable
      t.integer :category_id
      t.text :description
      t.string :image_url
      t.integer :user_id
      t.boolean :per_unit_pricing
      t.string :unit

      t.timestamps
    end
  end
end
