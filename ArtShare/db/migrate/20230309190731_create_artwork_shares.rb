class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.references :artwork, null: false, foreign_key: true
      t.references :viewer, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end

    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true
    change_column :users, :username, :string,  null:false
    change_column :artworks, :title, :string,  null:false
    change_column :artworks, :image_url, :string,  null:false
  end
end
