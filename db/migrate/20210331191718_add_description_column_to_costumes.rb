class AddDescriptionColumnToCostumes < ActiveRecord::Migration[6.1]
  def change
    add_column :costumes, :description, :text
  end
end
