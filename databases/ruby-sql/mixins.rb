# Mixins for working accessing the database, NOT WORKING!
module Mixins
  # TODO: get self to bind after being mixed in
  def self.choose(db, table, column, value)
    p 'Enter the number for the set you want, or type new.'
    available = filtered_list(db, table, column, value)
    available.each { |row| p row }
    choice = gets.chomp
    choice == 'new' ? create : availabe[choice - 1]
  end

  # TODO: implement a generic create method for adding instances
  def create
  end

  # TODO: implement a generic lookup helper for choose
  def filtered_list(db, table, column, value)
    db.execute 'SELECT * FROM (?) WHERE (?) = (?)', [table, column, value]
  end
end
