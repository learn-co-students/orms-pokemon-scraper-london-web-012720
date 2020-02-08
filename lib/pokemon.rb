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
        db.execute("SELECT * FROM pokemon WHERE id = ?;", id).map do |row|

            self.new_from_db(row)
          
        end.first
        end

        def self.new_from_db(row)
            self.new(id: row[0], name: row[1], type: row[2], db: @db)
       
        end

    
end
