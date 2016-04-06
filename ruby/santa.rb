# Santa class with speak and eat methods
class Santa
  def initialize
    puts 'Initalizing Santa instance...'
  end

  def speak
    puts 'Ho, ho, ho! Haaappy holidays!'
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}!"
  end
end

santa = Santa.new
santa.speak
santa.eat_milk_and_cookies 'oatmeal raising cookie'
