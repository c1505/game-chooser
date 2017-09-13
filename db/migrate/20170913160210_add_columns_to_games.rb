class AddColumnsToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :geek_link, :string
    add_column :games, :geek_id, :integer
    add_column :games, :image_link, :string
  end
end
