# Mixins for working accessing the database
module Mixin
  def choose(db, table, column, value)
    p 'Enter the number for the set you want, or type new.'
    available = filtered_list(db, table, column, value)
    available.each { |row| p row }
    choice = gets.chomp
    choice == 'new' ? add : availabe[choice - 1]
  end

  def add
  end

  def filtered_list(db, table, column, value)
    db.execute 'SELECT * FROM (?) WHERE (?) = (?)', [table, column, value]
  end
end
