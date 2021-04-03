class RemoveStatusColumnFromCostumesTable < ActiveRecord::Migration[6.1]
  def change
    remove_column(:costumes, :status, :text)
  end
end
