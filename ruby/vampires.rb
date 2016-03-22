def detect_vampire
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

	allergies = ""
	until allergies == "sunshine" || allergies == "done" do
		p "Please list your allergies, one at a time. When you are done, type 'done'."
		allergies = gets.chomp.downcase
	end

	if name == "Drake Cula" || name == "Tu Fang"
		return "Definitely a vampire"
	elsif (2016 - birth_year != age) && (likes_garlic == "no") && (wants_insurance == "no")
		return "Almost certainly a vampire"
	elsif allergies == "sunshine" || (2016 - birth_year != age) && (likes_garlic == "no") || (wants_insurance == "no")
		return "Probably a vampire"
	elsif (2016 - birth_year == age) && (likes_garlic == "yes") || (wants_insurance == "yes")
		return "Probably not a vampire"
	else
		return "Results inconclusive"
	end
end

p "How many employees will you be processing?"
how_many_employees = gets.chomp.to_i

while how_many_employees > 0 do
	p detect_vampire
	how_many_employees -= 1	
end

p "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
