class Puppy
  def initialize
    puts "Intitializing new puppy instance..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(num)
    num.times { puts "Woof!" }
  end

  def rollover
    puts "*rolls over*"
  end

  def dog_years(human_years)
    puts human_years * 7
  end

  def chase_tail(num)
    puts "*completes #{num} circles and falls down*"
  end
end

buddy = Puppy.new
buddy.fetch("tennis ball")
buddy.speak 4
buddy.rollover
buddy.dog_years 5
buddy.chase_tail 6