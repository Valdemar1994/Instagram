class AddFollowsCountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :follows_count, :integer
  end
end
