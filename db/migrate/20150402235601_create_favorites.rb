class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false
      t.integer :favoritable_id, null: false
      t.string :favoritable_type, null: false
      t.timestamps
    end
    add_index :favorites, [:user_id, :favoritable_id, :favoritable_type], unique: true, name: 'unique_favorites'
  end
end
