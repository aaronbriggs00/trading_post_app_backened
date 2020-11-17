class AddWebsiteAndPhoneNumberToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :website, :string
    add_column :users, :phone_number, :string
  end
end
