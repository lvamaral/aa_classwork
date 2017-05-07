class AddTimeStamp < ActiveRecord::Migration[5.0]
  def change
    add_column :long_urls, :created_at, :datetime
    add_column :long_urls, :updated_at, :datetime
    add_column :shortened_urls, :created_at, :datetime
    add_column :shortened_urls, :updated_at, :datetime
  end
end
