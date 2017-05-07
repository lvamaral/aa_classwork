class UpdateShortenedUrLsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :shortened_urls, :long_url_id
    add_column :shortened_urls, :long_url, :string
  end
end
