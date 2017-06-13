class CreateArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :image_url
      t.integer :artist_id
      t.timestamps
    end
    add_index :artwork, [:title, :artist_id], unique: true
  end
end
