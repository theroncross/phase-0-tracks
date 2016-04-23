# Mixins for working accessing the database
module Mixins
  def self.choose(db, table, column, value)
    p 'Enter the number for the set you want, or type new.'
    available = filtered_list(db, table, column, value)
    available.each { |row| p row }
    choice = gets.chomp
    choice == 'new' ? create : availabe[choice - 1]
  end

  def create
  end

  def filtered_list(db, table, column, value)
    db.execute 'SELECT * FROM (?) WHERE (?) = (?)', [table, column, value]
  end
end
