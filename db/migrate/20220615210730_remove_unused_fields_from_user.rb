class RemoveUnusedFieldsFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :age, :integer
    remove_column :users, :website, :string
    remove_column :users, :bio, :text
    remove_column :users, :phone, :integer
    remove_column :users, :gender, :string
  end
end
