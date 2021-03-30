class UpdateCostumesTable < ActiveRecord::Migration[6.1]
  def change
    change_table :costumes do |t|
      t.remove :user_id
    end
  end
end
