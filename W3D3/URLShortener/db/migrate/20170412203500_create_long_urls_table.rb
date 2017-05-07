class CreateLongUrlsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :long_urls do |t|
      t.string :url
    end
  end
end
