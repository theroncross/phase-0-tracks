# Santa class with speak and eat methods
class Santa
  attr_reader :gender, :ethnicity
  attr_accessor :age

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

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer)
    reindeer_ranking.delete reindeer
    reindeer_ranking.push reindeer
  end
end

genders = [
  'agender',
  'female',
  'bigender',
  'male',
  'female',
  'gender fluid',
  'N/A'
]
ethnicities = [
  'black',
  'Latino',
  'white',
  'Japanese-African',
  'prefer not to say',
  'Mystical Creature (unicorn)',
  'N/A'
]

i = 0
random_num = Random.new
until i == 1000
  santa = Santa.new(genders.sample, ethnicities.sample)
  santa.age = random_num.rand(140)
  puts "Santa # #{i}"
  puts "Gender: #{santa.gender}"
  puts "Ethnicity: #{santa.ethnicity}"
  puts "Age: #{santa.age}"
  i += 1
end
