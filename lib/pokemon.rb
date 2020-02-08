class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, database)
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL

        database.execute(sql, name, type)
    end

    def self.find(pokenum, database)
        sql = <<-SQL
        SELECT * FROM pokemon
        WHERE id = ?
        SQL

        poke = database.execute(sql, pokenum)[0]
        p = Pokemon.new(id: poke[0], name: poke[1], type:poke[2], db: database)
        pp p
    end
end
