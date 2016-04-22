module Mixin
  def choose(db)
    p 'Enter the number for the set you want, or type new.'
    availabe = db.execute 'SELECT * FROM sets'
    availabe.each { |row| p row }
    choice = gets.chomp
    chosen =
      if choice == 'new'
        new_set # TODO: implement new_set
      else
        availabe_sets[choice - 1]
      end
  end

  def filtered_list(db, table, column, value)
    db.execute 'SELECT * FROM (?) WHERE (?) = (?)', [table, column, value]
  end
end