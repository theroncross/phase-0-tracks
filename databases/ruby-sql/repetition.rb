# A repetition stores general information on the type of interval.
# Repetitions make up sets.
# The individual runs by athletes are not of this class.
# Reps will usually have either a work or rest interval, not both.
class Repetition
  def initialize(distance, effort, work_interval, rest_interval)
    @distance = distance
    @effort = effort
    @work_interval = work_interval
    @rest_interval = rest_interval
  end

  # TODO: implement filtering and improve formatting
  # TODO: 'new' doesn't work. Implement create method
  def self.choose(db)
    p 'Enter the number for the repetition you want, or type new.'
    available = db.execute'SELECT * FROM repetitions'
    available.each { |row| p row }
    choice = gets.chomp
    choice == 'new' ? create : available[choice.to_i - 1]
  end

  # saves the repetition to the database
  def save(db)
    db.execute 'INSERT INTO repetitions (distance, effort, work_interval, rest_interval) VALUES (?, ?, ?, ?)', [@distance, @effort, @work_interval, @rest_interval]
  end
end
