class Pokemon
    attr_accessor :name, :type
    attr_reader :id, :db
        def initialize(id:, name:, type:, db:)
            @name = name 
            @type = type 
            @id =id
            @db = db
        end

        def self.save(name, type, db)
                #alternative method
                db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
                # @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemons")[0][0]
        end

        def self.find(id, db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten

        self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
            
            #binding.pry

        end

        # def self.new_from_db(row)
        #     pokemon = self.new(row[0], row[1], row[2])
        #     pokemon
        # end

    
end
