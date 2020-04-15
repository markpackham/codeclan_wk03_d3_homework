require("pg")
require_relative("../db/sql_runner")
require_relative("artist")
class Album
  attr_reader :id, :title, :genre, :artist_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"]
  end

  # Create
  def save()
    sql = "INSERT INTO albums
      (
        title,
        genre,
        artist_id
      ) VALUES
      (
        $1, $2, $3
      )
      RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  # Read All
  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |order| Album.new(order) }
  end

  # Read One
  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    album_hash = SqlRunner.run(sql, values).first()
    return Album.new(album_hash) if album_hash
  end

  # Delete All
  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  # List Artist
  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    result_array = SqlRunner.run(sql, values)
    artist_data = result_array[0]
    return Artist.new(artist_data)
  end
end
