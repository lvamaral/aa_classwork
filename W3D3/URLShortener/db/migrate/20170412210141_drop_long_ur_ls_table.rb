class DropLongUrLsTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :long_urls
  end
end
