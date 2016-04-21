# For now, athletes only have names and birthdates.
# Eventually, you should be able to see their running histories.
class Athlete
  def initialize(name, birthdate)
    @name = name
    @birthdate = birthdate
  end

  # saves the athlete to the database
  def save
    db.execute 'INSERT INTO athletes (name, birthdate) VALUES ( ?, ?)', [@name, @birthdate]
  end
end
