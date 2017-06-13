# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat1 = Cat.create(birth_date: "2015/01/20", color: "black", name: "Midnight", sex: "M", description: "akhefgqkjhfas")
cat2 = Cat.create(birth_date: "2015/05/26", color: "white", name: "Morning", sex: "F", description: "jahrehenamns")
cat3 = Cat.create(birth_date: "1991/10/17", color: "orange", name: "October", sex: "M", description: "naefbjkabefa")

rental1 = CatRentalRequest.create(cat_id: 1, start_date: "2017/04/19", end_date: "2017/04/26", status: "PENDING")
rental2 = CatRentalRequest.create(cat_id: 2, start_date: "2017/04/19", end_date: "2017/04/26", status: "PENDING")
rental3 = CatRentalRequest.create(cat_id: 1, start_date: "2017/04/19", end_date: "2017/04/26", status: "PENDING")
rental4 = CatRentalRequest.create(cat_id: 1, start_date: "2017/04/27", end_date: "2017/04/30", status: "PENDING")
