class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize (id:, name:, type:, db:)
        @id, @name, @type, @db = id, name, type, db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) 
            VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
    end

    def self.find(id, db)
        pokemon = db.execute("SELECT * from pokemon WHERE id = #{id}").flatten
        Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
    end

end
