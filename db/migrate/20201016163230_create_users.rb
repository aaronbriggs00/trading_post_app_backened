class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.text :bio
      t.string :representation
      t.string :email

      t.timestamps
    end
  end
end
