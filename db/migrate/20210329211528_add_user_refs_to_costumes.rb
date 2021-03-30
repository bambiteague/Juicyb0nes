class AddUserRefsToCostumes < ActiveRecord::Migration[6.1]
  def change
    add_reference :costumes, :users
  end
end
