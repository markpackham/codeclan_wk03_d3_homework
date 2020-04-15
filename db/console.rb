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

artists = Artist.all()
albums = Album.all()

binding.pry
nil