class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.text :name

      t.timestamps
    end
  end
end
