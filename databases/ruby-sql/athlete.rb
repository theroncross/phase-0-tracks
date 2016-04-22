require_relative './mixins'
# For now, athletes only have names and birthdates.
# Eventually, you should be able to access their running histories.
# TODO: add to-date bests for calculating paces and goals
class Athlete
  include Mixin
  def initialize
    p 'Name:'
    @name = gets.chomp
    p 'Birthdate (YYYY-MM-DD):'
    @birthdate = gets.chomp
  end

  # saves the athlete to the database
  def save(db)
    db.execute 'INSERT INTO athletes (name, birthdate) VALUES ( ?, ?)', [@name, @birthdate]
  end
end
