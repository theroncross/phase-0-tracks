# Athlete repetitions represent a single run by an athlete.
# The purpose is to keep track of time for every run in practice.
# These instances can be used to monitor performance on a fine scale.
class AthleteRepetition
  def initialize(athlete_id, repetition_id, goal_time, start_time, elapsed_time)
    @athlete_id = athlete_id
    @repetition_id = repetition_id
    @goal_time = goal_time
    @start_time = start_time
    @elapsed_time = elapsed_time
  end

  # saves the athlete's repetetion to the database
  def save
    $db.execute 'INSERT INTO athlete_repetitions (athlete_id, repetition_id, start_time, goal_time, elapsed_time) VALUES (?, ?, ?, ?, ?)', [@athlete_id, @repetition_id, @goal_time, @start_time, @elapsed_time]
  end
end