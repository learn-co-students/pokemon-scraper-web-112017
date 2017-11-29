require "pry"
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
    #@hp = hp
  end

  def self.save(na, ty, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL

    db.execute(sql, na, ty)
  end

  def self.find(the_id, db)
    sql = <<-SQL
      SELECT * FROM  pokemon WHERE id = #{the_id};
    SQL

    return_vals = db.execute(sql)[0]
    #binding.pry
    self.new(id: return_vals[0], name: return_vals[1], type: return_vals[2], db: db)
    #binding.pry
  end

  # def alter_hp(hp, db)
  #   @hp = hp
  #
  # end

end
