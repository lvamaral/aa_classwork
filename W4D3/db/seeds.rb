# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# create_table "cat_rental_requests", force: :cascade do |t|
#   t.integer  "cat_id",     null: false
#   t.date     "end_date",   null: false
#   t.date     "start_date", null: false
#   t.string   "status",     null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.integer  "user_id",    null: false
# end

request1 = CatRentalRequest.create(cat_id: 1, start_date: "2017/04/20", end_date: "2017/04/27", status: "PENDING", user_id: 1)
