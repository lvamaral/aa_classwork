class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.string :short_url_id

      t.timestamps
    end
  end
end
