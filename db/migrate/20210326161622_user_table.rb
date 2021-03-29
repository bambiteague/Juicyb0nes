class UserTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :name
      t.integer :age
      t.string :email
    end
  end
end
