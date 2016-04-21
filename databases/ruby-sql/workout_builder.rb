require 'db'
require 'athlete'
require 'repetition'
require 'athlete_repetition'

athletes = [
  { name: 'Theron Cross',   birthdate: '1977-02-10' },
  { name: 'Jennifer Cross', birthdate: '1971-11-01' },
  { name: 'Ethan Cross',    birthdate: '2002-06-27' }
]
repetitions = [
  { distance: 100, effort: 90, work_interval: 120, rest_interval: nil }
]
athlete_repetitions = [
  { athlete_id: 1, repetition_id: 1, goal_time: 12, start_time: nil, finish_time: nil, elapsed_time: 12.34 }
]

def new_athlete_rep
  p 'Athlete id:'
  athlete_id = gets.chomp
  p 'Repetition id:'
  repetition_id = gets.chomp
  p 'Goal time (in seconds):'
  goal_time = gets.chomp
  p 'Press ENTER to start the timer'
  gets.chomp
  start_time = Time.new.to_f
  p 'Press ENTER again to stop timer'
  gets.chomp
  elapsed_time = Time.now.to_f - start_time
  p elapsed_time
  AthleteRepetition.new(athlete_id, repetition_id, goal_time, start_time, elapsed_time).save
end

new_athlete_rep

def print_results
  ath_reps = $db.execute 'SELECT athletes.name, athlete_repetitions.elapsed_time FROM athletes JOIN athlete_repetitions ON athletes.id = athlete_repetitions.athlete_id'
  ath_reps.each { |row| p row }
end
