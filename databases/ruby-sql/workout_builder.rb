require 'sqlite3'
require 'faker'

db = SQLite3::Database.new('workout_builder.db')

create_athlete_table = <<-ATHLETE_TABLE
  CREATE TABLE IF NOT EXISTS athletes (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  birthdate INTEGER);
ATHLETE_TABLE

db.execute(create_athlete_table)
