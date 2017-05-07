class CreateShortenedUrLs < ActiveRecord::Migration[5.0]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url
      t.string :short_url
      t.integer :user_id
    end
    add_index :shortened_urls, :short_url
    add_index :shortened_urls, :user_id
  end
end
