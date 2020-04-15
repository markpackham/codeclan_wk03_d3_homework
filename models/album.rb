require("pg")
require_relative("../db/sql_runner")
class Album
  attr_reader :id, :title, :genre, :artist_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"]
  end

  # Read All
  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |order| Album.new(order) }
  end

  # Delete All
  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end
end
