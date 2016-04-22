# A repetition stores general information on the type of interval.
# Repetitions make up sets.
# The instances of repetitions for individuals are not of this class.
# Reps will usually have either a work or rest interval, not both.
class Repetition
  def initialize(distance, effort, work_interval, rest_interval)
    @distance = distance
    @effort = effort
    @work_interval = work_interval
    @rest_interval = rest_interval
  end

  # saves the repetition to the database
  def save(db)
    db.execute 'INSERT INTO repetitions (distance, effort, work_interval, rest_interval) VALUES (?, ?, ?, ?)', [@distance, @effort, @work_interval, @rest_interval]
  end
end
