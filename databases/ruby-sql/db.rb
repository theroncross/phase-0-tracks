require 'sqlite3'

module DB
  @table_strings = [
      "CREATE TABLE IF NOT EXISTS athletes (
        id        INTEGER PRIMARY KEY,
        name      VARCHAR(20) NOT NULL,
        birthdate VARCHAR(12),
        UNIQUE (name)
      );",
      "CREATE TABLE IF NOT EXISTS repetitions (
        id            INTEGER PRIMARY KEY,
        distance      INTEGER,
        effort        INTEGER,
        work_interval INTEGER,
        rest_interval INTEGER
      );",
      "CREATE TABLE IF NOT EXISTS sets (
        id            INTEGER PRIMARY KEY,
        name          VARCHAR(30),
        description   VARCHAR(255),
        training_type VARCHAR(30)
      );",
      "CREATE TABLE IF NOT EXISTS athlete_repetitions (
        id            INTEGER PRIMARY KEY,
        athlete_id    INTEGER,
        repetition_id INTEGER,
        goal_time     INTEGER,
        start_time    INTEGER,
        elapsed_time  REAL,
        FOREIGN KEY (athlete_id)    REFERENCES athletes(id),
        FOREIGN KEY (repetition_id) REFERENCES repetitions(id)
      );",
      "CREATE TABLE IF NOT EXISTS repetition_sets (
        id            INTEGER PRIMARY KEY,
        repetition_id INTEGER,
        set_id        INTEGER,
        quantity      INTEGER,
        date          INTEGER,
        notes         VARCHAR(255),
        FOREIGN KEY (repetition_id) REFERENCES repetitions(id),
        FOREIGN KEY (set_id)        REFERENCES sets(id)
      );",
      "CREATE TABLE IF NOT EXISTS athlete_repetition_sets (
        athlete_id        INTEGER,
        repetition_set_id INTEGER,
        FOREIGN KEY (athlete_id)        REFERENCES athletes(id),
        FOREIGN KEY (repetition_set_id) REFERENCES repetition_sets(id)
      );"
  ]

  def create_tables(db)
    @table_strings.each { |str| db.execute(str) }
  end

  def create_database(name)
    db = SQLite3::Database.new(name)
    create_tables(db)
    db
  end
end
