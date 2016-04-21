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

  def save
    $db.execute 'INSERT INTO repetition_sets (repetition_id, set_id, quantity, date, notes) VALUES [?, ?, ?, ?, ?]', @repetition_id, @set_id, @quantity, @date, @notes]
  end
end
