require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(name:, type:, db:, id:, hp: 60)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name,type) VALUES (?,?)", name,type)
  end

  def self.find(id, db)
    a = db.execute("SELECT * FROM pokemon WHERE id = #{id}")[0]
    self.new(id: a[0], name: a[1], type: a[2], db: db, hp: a[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?;", hp, self.name)
  end

end
