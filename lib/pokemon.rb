class Pokemon
  attr_reader :name, :type, :db, :id, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name,type)
  end

  def self.find(id, db)
    arr = db.execute("SELECT * FROM pokemon WHERE id = #{id}")[0]
    Pokemon.new(id: arr[0], name: arr[1], type: arr[2], db: db, hp: arr[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{self.id}")
    testo = db.execute("SELECT * FROM pokemon WHERE id = #{self.id}")
  end
end
