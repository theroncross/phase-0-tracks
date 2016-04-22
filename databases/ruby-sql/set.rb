# Sets are generic groups of repetitions
# Sets have names and training types
class Set
  def initialize(name, description, training_type)
    @name = name
    @description = description
    @training_type = training_type
  end

  def save
    $db.execute 'INSERT INTO sets (name, description, training_type) VALUES (?, ?, ?)', [@name, @description, @training_type]
  end

  def choose
    p 'Enter the number for the set you want, or type new.'
    availabe_sets = $db.execute 'SELECT * FROM sets'
    availabe_sets.each { |row| p row }
    choice = gets.chomp
    chosen_set =
      if choice == 'new'
        new_set # TODO: implement new_set
      else
        availabe_sets[choice - 1]
      end
  end

  def filter_by(column, value)
    $db.execute 'SELECT * FROM sets WHERE (?) = (?)', [column, value]
  end
end
