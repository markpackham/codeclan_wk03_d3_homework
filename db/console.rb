require("pry")
require_relative("../models/album")
require_relative("../models/artist")

Album.delete_all()
Artist.delete_all()

# Create artists
artist1 = Artist.new( {"name" => "Coldplay"})
artist2 = Artist.new( {"name" => "Queen"})
artist3 = Artist.new( {"name" => "Imagine Dragons"})

# Save artists
artist1.save()
artist2.save()
artist3.save()

# Create Albums
album1 = Album.new( {"title" => "Parachutes", "genre" => "Rock", "artist_id" => artist1.id})
album2 = Album.new( {"title" => "X & Y", "genre" => "Rock", "artist_id" => artist1.id})
album3 = Album.new( {"title" => "The Works", "genre" => "Rock", "artist_id" => artist2.id})
album4 = Album.new( {"title" => "The Miracle", "genre" => "Rock", "artist_id" => artist2.id})
album5 = Album.new( {"title" => "Origins", "genre" => "Rock", "artist_id" => artist3.id})
album6 = Album.new( {"title" => "Evolve", "genre" => "Rock", "artist_id" => artist3.id})

# Save albums
album1.save()
album2.save()
album3.save()
album4.save()
album5.save()
album6.save()

# artists = Artist.all()
# albums = Album.all()

binding.pry
nil