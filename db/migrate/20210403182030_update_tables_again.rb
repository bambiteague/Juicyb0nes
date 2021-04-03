class UpdateTablesAgain < ActiveRecord::Migration[6.1]
  def change
    remove_column(:users, :reviews, :text)
    add_column(:costumes, :ranking, :integer)
    add_column(:costumes, :suit_owner, :text)
  end
end
