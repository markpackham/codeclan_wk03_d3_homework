require("pg")
require_relative("../db/sql_runner")
require_relative("album")

class Artist
    attr_accessor :name
    attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  # Create
  def save()
    sql = "INSERT INTO artists
    (
      name
    ) VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  # Update
  def update()
    sql = "
    UPDATE artists SET (
      name
    ) = row
    (
      $1
    )
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  # Read All
  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |order| Artist.new(order) }
  end

  # Read One
  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    artist_hash = SqlRunner.run(sql, values).first()
    return Artist.new(artist_hash) if artist_hash
  end

  # Delete All
  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def find_albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    albums = results.map { |album_data| Album.new(album_data) }
    return albums
  end
end
