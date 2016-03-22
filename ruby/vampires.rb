def detect_vampire()
	p "What is your name?"
	name = gets.chomp

	p "What is your age?"
	age = gets.chomp.to_i

	p "What year were you born?"
	birth_year = gets.chomp.to_i

	p "Our company cafeteria serves garlic bread. Should we order some for you? (yes/no)"
	likes_garlic = gets.chomp.downcase

	p "Would you like to enroll in our companies health insurance? (yes/no)"
	wants_insurance = gets.chomp.downcase

	result = ""
	if name == "Drake Cula" || name == "Tu Fang"
		result = "Definitely a vampire"
	elsif (2016 - birth_year != age) && (likes_garlic == "no") && (wants_insurance == "no")
		result = "Almost certainly a vampire"
	elsif (2016 - birth_year != age) && (likes_garlic == "no") || (wants_insurance == "no")
		result = "Probably a vampire"
	elsif (2016 - birth_year == age) && (likes_garlic == "yes") || (wants_insurance == "yes")
		result = "Probably not a vampire"
	else
		result = "Results inconclusive"
	end
end

p detect_vampire