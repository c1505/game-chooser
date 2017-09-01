class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :time
      t.integer :max_players
      t.integer :min_players
      t.float :complexity
      t.float :rating

      t.timestamps
    end
  end
end
