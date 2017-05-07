class UpdateVisitsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :visits, :short_url_id
    add_column :visits, :short_url_id, :integer
  end
end
