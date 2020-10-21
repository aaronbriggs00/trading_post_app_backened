class RemoveRepresentationFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :representation
  end
end
