require "sqlite3"
require 'csv'

class Pokemon

attr_accessor :name, :type, :db, :id, :hp

  def initialize (id:nil, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    # @all < self
  end

def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES ( ?, ?)", name, type)
end

def self.find(id, db)
  result = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
  Pokemon.new(id: result[0], name: result[1], type: result[2], hp: result[3], db: @db)
end

def alter_hp(hp=60, db)
   sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
    db.execute(sql, hp, self.id)
end


end
