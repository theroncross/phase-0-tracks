puts "Hamster's name?"
name = gets.chomp

puts "How loud is your hamster from 1-10?"
volume = gets.chomp.to_i

puts "What is their fur color?"
fur_color = gets.chomp

puts "Is the hamster a good candidate for adoption? (y/n)"
adoptable = gets.chomp == "y" ? true : false

puts "What is their estimated age?"
age = gets.chomp
age.empty? ? age = nil : age.to_i

puts "Name:       #{name}"
puts "Volume:     #{volume}"
puts "Color:      #{fur_color}"
puts "Adoptable:  #{adoptable}"
puts "Age:        #{age || "unknown"}"