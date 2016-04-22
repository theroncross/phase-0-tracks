# Sets are generic groups of repetitions
# Sets have names and training types
class Set
  def initialize(name, description, training_type)
    @name = name
    @description = description
    @training_type = training_type
  end

  def save(db)
    db.execute 'INSERT INTO sets (name, description, training_type) VALUES (?, ?, ?)', [@name, @description, @training_type]
  end
end
