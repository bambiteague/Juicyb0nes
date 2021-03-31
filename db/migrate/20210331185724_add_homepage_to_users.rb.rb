class AddHomepageToUsers < ActiveRecord::Migration[6.1]
  def change
  add_column :users, :reviews, :text
  end
end
