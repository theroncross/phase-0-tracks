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

