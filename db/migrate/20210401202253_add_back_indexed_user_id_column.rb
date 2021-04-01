class AddBackIndexedUserIdColumn < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :costumes, :users
  end
end
