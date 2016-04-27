# Repetition sets are specific instances of sets
# They include the date, quantity, and notes
class RepetitionSet
  def initialize(repetition_id, set_id, quantity, date, notes)
    @repetition_id = repetition_id
    @set_id = set_id
    @quantity = quantity
    @date = date
    @notes = notes
  end

  def self.choose(db)
    p 'Enter the number for the set of repetitions you want, or type new.'
    available = db.execute'SELECT * FROM repetition_sets'
    available.each { |row| p row }
    choice = gets.chomp
    choice == 'new' ? create : available[choice.to_i - 1]
  end

  def save(db)
    db.execute 'INSERT INTO repetition_sets (repetition_id, set_id, quantity, date, notes) VALUES (?, ?, ?, ?, ?)',[@repetition_id, @set_id, @quantity, @date, @notes]
  end
end
