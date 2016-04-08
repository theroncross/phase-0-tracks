# Creates a todolist class with get_items and get_item, add, delete methods
class TodoList
  def initialize(first_items)
    @chores = first_items
  end

  def get_items
    @chores
  end

  def add_item(item)
    @chores << item
  end

  def delete_item(item)
    @chores.delete item
  end

  def get_item(item_index)
    @chores[item_index]
  end
end
