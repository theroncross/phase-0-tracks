def detect_vampire
	p "What is your name?"
	name = gets.chomp

	p "What is your age?"
	age = gets.chomp.to_i

	p "What year were you born?"
	birth_year = gets.chomp.to_i

	p "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
	likes_garlic = gets.chomp.downcase

	p "Would you like to enroll in our companies health insurance? (y/n)"
	wants_insurance = gets.chomp.downcase

	p "Please list your allergies, one at a time. When you're done, type 'done'."
	allergies = []
	until allergies == "sunshine" || allergies == "done" do
		allergies << gets.chomp.downcase
	end

	result =
		if name == "Drake Cula" || name == "Tu Fang"
			"Definitely a vampire"
		elsif (2016 - birth_year != age) && (likes_garlic == "n") && (wants_insurance == "n")
			"Almost certainly a vampire"
		elsif allergies.include?("sunshine") || [age, age-1].include?(2016 - birth_year) && (likes_garlic == "n") || (wants_insurance == "n")
			"Probably a vampire"
		elsif (2016 - birth_year == age) && (likes_garlic == "y") || (wants_insurance == "y")
			"Probably not a vampire"
		else
			"Results inconclusive"
		end
end

p "How many employees will you be processing?"
employee_count = gets.chomp.to_i
employee_count.times do puts detect_vampire end

p "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
