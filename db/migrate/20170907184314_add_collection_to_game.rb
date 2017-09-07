class AddCollectionToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :collection_id, :integer
  end
end
