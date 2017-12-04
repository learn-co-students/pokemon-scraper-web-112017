
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(id:, name:, type:, db:, hp:nil)
    #notice that we create a default value for hp of nothing
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    #purpose is to save an instance of Pokemon to the db
    #is a Class method -- because we are saving to the table that correlates to the Class level
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    #in this lab, the pokemon database has already been created for us; this is the database that is being fed in by spec
    #moreover, the schema (i.e. table) for "pokemon" has already been created, so we can "hardcode" refer to it as the "pokemon" table
  end

  def self.find(id, db)
    #purpose is to search the db for a specific instance of Pokemon, then pull it into short-term memory thru instantiation
    #you find this method the proper database to search; the pokemon table is hardcoded here; and the id # of the pokemon you're interested in
    attributes = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    #above - get all the data about this pokemon that exists in the db -- put it in array form
    pokemon = self.new(id: attributes[0], name: attributes[1], type: attributes[2], db: db, hp: attributes[3])
    #above - mass assign the values in the db/table for this row, and instantiate a new pokemon in short-term memory
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end


end
