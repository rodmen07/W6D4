class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :image_url
      t.references :artist, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
    add_index :artworks, :image_url, unique: true
    add_index :artworks, [:artist_id, :title], unique: true
  end
end
