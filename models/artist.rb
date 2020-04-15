require("pg")

attr_reader :id, :name

class Artist
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end
end
