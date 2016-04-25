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
  # TODO: implement multiple athletes timed simultaneously
  def new_athlete_rep(db, athlete_id, repetition_id, repetition_set_id, goal_time)
    p 'Press "Enter" to START the timer'
    gets.chomp
    start_time = (Time.new.to_f).round(2)
    # TODO: hit stop for each athlete running and assign times to each
    p 'Press "Enter" again to STOP the timer'
    gets.chomp
    elapsed_time = (Time.new.to_f - start_time).round(2)
    p elapsed_time
    AthleteRepetition.new(athlete_id, repetition_id, repetition_set_id, goal_time, start_time, elapsed_time).save db
  end

  # Prints repetition information, filtered by athlete
  # TODO: fix date formatting, filter by set
  def print_results(db, athlete_name)
    ath_reps = db.execute 'SELECT athletes.name, repetitions.distance, repetitions.effort, athlete_repetitions.elapsed_time, repetition_sets.date FROM athletes JOIN athlete_repetitions ON athletes.id = athlete_repetitions.athlete_id JOIN repetition_sets ON athlete_repetitions.repetition_set_id = repetition_sets.id JOIN repetitions ON repetition_sets.repetition_id = repetitions.id WHERE athletes.name = (?)', [athlete_name]
    ath_reps.each { |row| p "#{row[0]} ran #{row[1]}m at #{row[2]}% effort in #{row[3]}s on #{row[4]}" }
  end
end

# Driver code for testing
# For now, everything but athlete_repetitions need to be added manually
include DB, Workout
db = DB.create_database 'spring2016'
athlete = Athlete.choose db
repetition_set = RepetitionSet.choose db
p 'Goal time (in seconds):'
goal_time = gets.chomp
repetition_set[3].times do
  Workout.new_athlete_rep db, athlete[0], repetition_set[1], repetition_set[0], goal_time
end
Workout.print_results db, athlete[1]
