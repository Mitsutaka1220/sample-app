class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :from_user_id
      t.integer :to_micropost_id

      t.timestamps
    end
    add_index :favorites, :from_user_id
    add_index :favorites, :to_micropost_id
    add_index :favorites, [:from_user_id, :to_micropost_id], unique: true
  end
end
