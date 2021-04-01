class RemoveColumnFromCostumes < ActiveRecord::Migration[6.1]
  def change
    remove_column :costumes, :user_id
  end
end
