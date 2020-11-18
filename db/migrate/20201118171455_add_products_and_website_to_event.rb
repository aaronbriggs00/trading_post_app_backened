class AddProductsAndWebsiteToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :products, :string
    add_column :events, :website, :string
  end
end
