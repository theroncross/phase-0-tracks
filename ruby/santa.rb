# Santa class with speak and eat methods
class Santa
  def initialize(gender, ethnicity)
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = %w(
      'Rudolph'
      'Dasher'
      'Dancer'
      'Prancer'
      'Vixen'
      'Comet'
      'Cupid'
      'Donner'
      'Blitzen'
    )
    @age = 0
  end

  def speak
    puts 'Ho, ho, ho! Haaappy holidays!'
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}!"
  end
end

santas = []
genders = %w(
  'agender'
  'female'
  'bigender'
  'male'
  'female'
  'gender fluid'
  'N/A'
)
ethnicities = %w(
  'black'
  'Latino'
  'white'
  'Japanese-African'
  'prefer not to say'
  'Mystical Creature (unicorn)'
  'N/A'
)

20.times { santas << Santa.new(genders.sample, ethnicities.sample) }
