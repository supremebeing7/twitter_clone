class UpdateFollowers < ActiveRecord::Migration
  def change
    rename_table :followers, :relationships
    rename_column :relationships, :user_id, :followed_id
  end
end
