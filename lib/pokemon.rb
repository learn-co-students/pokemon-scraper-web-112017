require "pry"

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp:)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    new_pokemon = Pokemon.new(id: data[0], name: data[1], type: data[2], hp: data[3], db: db)
  end

  def alter_hp(hp_value, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp_value, self.id)
  end

end
