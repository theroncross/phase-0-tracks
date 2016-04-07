# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
# create a temporary hash
# split the string and add individual elements to the temp hash with the default  quantity of 1
# print the list to the console [can you use one of your other methods here?]
# output: return the temporary hash

# Method to add an item to a list
# input: item name and optional quantity ( 'carrots', 2), and list
# steps:
# get user input on item and quantity
# validate data
# add the information to the hash
# output: confirmtion of add

# Method to remove an item from the list
# input: item name and list
# steps:
# validate that thing is on list
# remove item from hash
# output: confirmation of removal

# Method to update the quantity of an item
# input: item name and new quantity
# steps:
# validate that thing exists
# look up key and change value
# output: confirm update

# Method to print a list and make it look pretty
# input:
# steps:
# print key: value - alphabetized - on their own lines
# output: pretty list

# fix list output

def new_list(str)
  initial_list = {}
  str.split(' ').each { |item| initial_list[item] = 1 }
  print_list initial_list
  initial_list
end

def add_item(list, item, quantity = 1)
  list[item] = quantity
end

def remove_item(list, item)
  list.include?(item) ? list.delete(item) : p("No #{item} in this list")
end

def update_item(list, item, quantity)
  list.include?(item) ? list[item] = quantity : p("No #{item} in this list")
end

def print_list(list)
  puts 'Your groceries:'
  list.each_pair { |item, quantity| puts "#{item}: #{quantity}" }
end

groceries = new_list('carrots apples cereal pizza')
update_item(groceries, 'carrots', 4)
add_item(groceries, 'potatoes')
add_item(groceries, 'leeks', 1)
update_item(groceries, 'apples', 9)
update_item(groceries, 'potatoes', 2)
update_item(groceries, 'popatoes', 2)
remove_item(groceries, 'leeks')
remove_item(groceries, 'leaks')
print_list(groceries)

# # Reflection
# I'm generally not a fan of pseudocoding unless I hit a roadblock. I find myself trying to implement the solution in words when all I'm really doing is writing the code twice. I can definitely see how it would be useful on a difficult problem or when working with a team to get everyone on the same page.
# Arrays are great for storing lists of the same thing, but you can only store one property of the thing unless you want an array of hashes. Hashes let you store multiple properties of something, or multiple things with two properties (name and quantity, in this case)
# Methods return the return value of the last statement that gets executed.
# Arguments can be almost anything, including other methods.
# Methods can pass information to other methods either by passing either the one method as an argument to another or by assigning the return of one method to a variable and passing that variable as an argument.
# Our biggest challenge was not wanting to change the task as it was written. This seemed like we were trying to fit a square peg into a round hole. I'm not sure if anything was really solidified, though I do recognize that my eagerness to get code down isn't helpful to my pairs.