require 'sqlite3'

$db = SQLite3::Database.new('workout_builder.db')

create_athletes_table = <<-SQL
  CREATE TABLE IF NOT EXISTS athletes (
    id        INTEGER PRIMARY KEY,
    name      VARCHAR(255) NOT NULL,
    birthdate VARCHAR(255),
    UNIQUE (name)
  );
SQL

create_repetitions_table = <<-SQL
  CREATE TABLE IF NOT EXISTS repetitions (
    id            INTEGER PRIMARY KEY,
    distance      INTEGER,
    effort        VARCHAR(20),
    work_interval INTEGER,
    rest_interval INTEGER
  );
SQL

create_sets_table = <<-SQL
  CREATE TABLE IF NOT EXISTS sets (
    id            INTEGER PRIMARY KEY,
    name          VARCHAR(30),
    description   VARCHAR(255),
    training_type VARCHAR(30)
  );
SQL

create_athlete_repetitions_table = <<-SQL
  CREATE TABLE IF NOT EXISTS athlete_repetitions (
    id            INTEGER PRIMARY KEY,
    athlete_id    INTEGER,
    repetition_id INTEGER,
    goal_time     INTEGER,
    start_time    INTEGER,
    elapsed_time  REAL,
    FOREIGN KEY (athlete_id)    REFERENCES athletes(id),
    FOREIGN KEY (repetition_id) REFERENCES repetitions(id)
  );
SQL

create_repetition_sets_table = <<-SQL
  CREATE TABLE IF NOT EXISTS repetition_sets (
    id            INTEGER PRIMARY KEY,
    repetition_id INTEGER,
    set_id        INTEGER,
    quantity      INTEGER,
    date          INTEGER,
    notes         VARCHAR(255),
    FOREIGN KEY (repetition_id) REFERENCES repetitions(id),
    FOREIGN KEY (set_id)        REFERENCES sets(id)
  );
SQL

create_athlete_repetition_sets_table = <<-SQL
  CREATE TABLE IF NOT EXISTS athlete_repetition_sets (
    athlete_id        INTEGER,
    repetition_set_id INTEGER,
    FOREIGN KEY (athlete_id)        REFERENCES athletes(id),
    FOREIGN KEY (repetition_set_id) REFERENCES repetition_sets(id)
  );
SQL

$db.execute(create_athletes_table)
$db.execute(create_repetitions_table)
$db.execute(create_sets_table)
$db.execute(create_athlete_repetitions_table)
$db.execute(create_repetition_sets_table)
$db.execute(create_athlete_repetition_sets_table)