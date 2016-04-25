require_relative './mixins'
# For now, athletes only have names and birthdates.
# Eventually, you should be able to access their running histories.
# TODO: add to-date bests for calculating paces and goals
class Athlete
  def initialize
    p 'Name:'
    @name = gets.chomp
    p 'Birthdate (YYYY-MM-DD):'
    @birthdate = gets.chomp
  end

  # Class method for listing and selecting athletes
  def self.choose(db)
    p 'Enter the number for the athlete you want, or type new.'
    available = db.execute'SELECT * FROM athletes'
    available.each { |row| p row }
    choice = gets.chomp
    choice == 'new' ? create : available[choice.to_i - 1]
  end

  # saves the athlete to the database
  # TODO: create a mixin that takes an args object
  def save(db)
    db.execute 'INSERT INTO athletes (name, birthdate) VALUES ( ?, ?)', [@name, @birthdate]
  end
end
