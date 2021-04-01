class UpdateColumnUserId < ActiveRecord::Migration[6.1]
  def change
    rename_column :costumes, :users_id, :user_id
  end
end
