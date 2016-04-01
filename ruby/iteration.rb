# Release 0
def scary_story
  puts "It was a quiet night until..."
  yield("Wolfman", "The Blob", "ate", "ooozed")
end

scary_story { |monster1, monster2, action1, action2| puts "#{monster1} escaped from the graveyard and went to a bar. It #{action1} three customers. At the same time #{monster2} #{action2} on the top of Lookout Hill."}

# Release 1
car_companies = ["Toyota", "Ford", "Honda", "BMW", "Mercedes"]
fish = { "tuna" => "maguro", "halibut" => "saba", "shrimp" => "ebi", "octopus" => "tako"}

p car_companies
car_companies.each { |company| puts "These are car companies: #{company}"}
p car_companies

p fish
fish.each { |english, japanese| puts "#{english.capitalize} is #{japanese} in Japanese"}
p fish

p car_companies
car_companies.map! { |company| company.upcase }
p car_companies

# Release 3
vowels = ["a", "e", "i", "o", "u"]
numbers = {1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five"}
# returns a structure without anything that evaluates to true
p vowels.reject { |vowel| vowel.next == "f" }
p numbers.reject { |digit, word| digit == word.length }
# returns a structure with only those elements that evaluate to true
p vowels.select { |vowel| "Chicago".include?(vowel) }
p numbers.select { |digit, word| digit >= word.length }
p vowels
# changes the structure to contain only those elements that evaluate true
p vowels.keep_if { |vowel| "Chicago".include?(vowel) }
p numbers.keep_if { |digit, word| digit >= word.length }
p vowels

# reset after dangerouse 'keep if' above
vowels = ["a", "e", "i", "o", "u"]
numbers = {1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five"}
# drops elements until the block evaluates to false
p vowels.drop_while { |vowel| "a being".include?(vowel) }
p numbers.drop_while { |digit, word| digit < word.length }