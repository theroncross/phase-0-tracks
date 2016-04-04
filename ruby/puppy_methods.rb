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
    human_years * 7
  end

  def chase_tail(num)
    puts "*completes #{num} circles before falling down*"
  end
end

buddy = Puppy.new
buddy.fetch("tennis ball")
buddy.speak 4
buddy.rollover
buddy.dog_years 5
buddy.chase_tail 6

class CdPlayer
  def initialize
    puts "No music is playing"
  end

  def insert(disc)
    puts "Opening..."
    puts "Closing..."
    puts "Ooh, #{disc}, good choice."
  end

  def play(track)
    puts "Are you sure? I like #{track + 1} more, but if you insist."
  end

  def stop
    puts "Oh thank god. My motors were getting tired."
  end
end

annoying_cd_players = []
50.times { annoying_cd_players << CdPlayer.new }
annoying_cd_players.each do |player|
  player.insert "ABBA Waterloo"
  player.play 1
  player.stop
end
