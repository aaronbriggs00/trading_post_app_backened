class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :state
      t.string :city
      t.string :name
      t.datetime :date
      t.string :address

      t.timestamps
    end
  end
end
