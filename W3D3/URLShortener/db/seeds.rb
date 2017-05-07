# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!("john.doe@gmail.com")
user2 = User.create!("jane.doe@gmail.com")
user3 = User.create!("jill.doe@gmail.com")
user4 = User.create!("jack.doe@gmail.com")

link1 = ShortenedUrl.create!(1, "www.facebook.com")
link2 = ShortenedUrl.create!(2, "www.reddit.com")
link3 = ShortenedUrl.create!(3, "www.weather.com")

visit1 = Visit.record_visit!(1, 1)
visit2 = Visit.record_visit!(2, 2)
visit3 = Visit.record_visit!(3, 3)
visit4 = Visit.record_visit!(4, 1)
visit5 = Visit.record_visit!(2, 1)
visit6 = Visit.record_visit!(3, 1)
visit7 = Visit.record_visit!(4, 2)
visit8 = Visit.record_visit!(1, 1)
