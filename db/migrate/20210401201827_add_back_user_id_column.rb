class AddBackUserIdColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :costumes, :user_id, :integer
  end
end
