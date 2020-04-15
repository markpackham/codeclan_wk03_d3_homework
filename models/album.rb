require("pg")

attr_reader :id, :title, :genre, :artist_id

class Album
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"]
  end
end
