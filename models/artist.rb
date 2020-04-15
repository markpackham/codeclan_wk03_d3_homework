require("pg")
require_relative("../db/sql_runner")
require_relative("album")
class Artist
  attr_reader :id, :name

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


  def album()
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@artist_id]
    result_array = SqlRunner.run(sql, values)
    album_data = result_array[0]
    return Album.new(album_data)
  end
end
