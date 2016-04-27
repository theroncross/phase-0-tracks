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
theron = Athlete.new
theron.save
speed_endurance_100 = Repetition.new(100, 90, 120, nil)
speed_endurance_100.save
workout = Workout.new
workout.new_athlete_rep
workout.print_results
