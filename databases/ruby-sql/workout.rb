require_relative './mixins'
require_relative './db'
require_relative './athlete'
require_relative './repetition'
require_relative './set'
require_relative './athlete_repetition'
require_relative './repetition_set'

# This should provide the interface for timing athletes
# The new_rep method will eventually take multiple athletes,
# each with their own goal times and elapsed times
# Each athlete rep is saved individually for reporting later
module Workout
  def new_athlete_rep(db, athlete_id, repetition_id)
    # TODO: get best times from database and use to calculate based on effort
    p 'Goal time (in seconds):'
    goal_time = gets.chomp
    p 'Press ENTER to start the timer'
    gets.chomp
    start_time = Time.new.to_f
    # TODO: hit stop for each athlete running and assign times to each
    p 'Press ENTER again to stop timer'
    gets.chomp
    # TODO: round these to two digits
    elapsed_time = Time.now.to_f - start_time
    p elapsed_time
    AthleteRepetition.new(athlete_id, repetition_id, goal_time, start_time, elapsed_time).save db
  end

  # TODO: format this to include the repetition information
  def print_results(db)
    ath_reps = db.execute 'SELECT athletes.name, athlete_repetitions.elapsed_time FROM athletes JOIN athlete_repetitions ON athletes.id = athlete_repetitions.athlete_id'
    ath_reps.each { |row| p row }
  end
end

# Driver code for testing
include DB, Workout
db = DB.create_database 'spring2016'
athlete = Athlete.choose db
repetition = Repetition.choose db
Workout.new_athlete_rep db, athlete[0], repetition[0]
Workout.print_results db
