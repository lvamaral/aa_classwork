# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: "eadams17")
user2 = User.create(username: "prettyprincess72")
user3 = User.create(username: "yungthug10")
user4 = User.create(username: "HxCqueen")
user5 = User.create(username: "majorlazer66")

art1 = Artwork.create(title: 'Sunset', image_url: "https://static.pexels.com/photos/33067/sunset-sunrise-sun-summer.jpg", artist_id: 1)
art2 = Artwork.create(title: 'Ice Cream Castle', image_url: "http://wallpapercraze.com/images/wallpapers/icecreamland-526926.jpeg", artist_id: 2)
art3 = Artwork.create(title: 'Dreamz', image_url: "https://s-media-cache-ak0.pinimg.com/564x/4b/eb/bb/4bebbbca165313e19afa56bc2a596162.jpg", artist_id: 3)

share1 = ArtworkShare.create(artwork_id: 1, viewer_id: 2)
share2 = ArtworkShare.create(artwork_id: 1, viewer_id: 3)
share3 = ArtworkShare.create(artwork_id: 1, viewer_id: 4)
share4 = ArtworkShare.create(artwork_id: 2, viewer_id: 1)
share5 = ArtworkShare.create(artwork_id: 2, viewer_id: 3)
share6 = ArtworkShare.create(artwork_id: 2, viewer_id: 4)
share7 = ArtworkShare.create(artwork_id: 2, viewer_id: 5)
share8 = ArtworkShare.create(artwork_id: 3, viewer_id: 1)
share9 = ArtworkShare.create(artwork_id: 3, viewer_id: 5)
