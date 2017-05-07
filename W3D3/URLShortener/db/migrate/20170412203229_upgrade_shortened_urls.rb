class UpgradeShortenedUrls < ActiveRecord::Migration[5.0]
  def change
    remove_column :shortened_urls, :long_url
    add_column :shortened_urls, :long_url_id, :integer
  end
end
