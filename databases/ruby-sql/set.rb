# Sets are generic types of training for athletes (eg sprint warmup)
# Sets have names and training types, but no specific numbers
# Specifics values are added in repetition sets
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
