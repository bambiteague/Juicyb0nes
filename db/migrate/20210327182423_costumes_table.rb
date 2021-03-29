class CostumesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :costumes do |t|
      t.text :name
      t.text :status
      t.integer :user_id
    end
  end
end
