# A shout module
# module Shout
#   def self.yell_angrily(words)
#     words + '!!!' + ':('
#   end

#   def self.yell_happily(words)
#     words + '!!!' + ':)'
#   end
# end

# puts Shout.yell_angrily 'Dad blast it'
# puts Shout.yell_happily 'Golly gumby'

# A Shout module for mixin in to classes
module Shout
  def yell_angrily(words)
    puts "#{words}!!! >:|"
  end

  def yell_happily(words)
    puts "#{words}!!! :)"
  end
end

# Soccer moms with Shout mixins
class SoccerMom
  include Shout
end

# Soccer kids with Shout mixins
class SoccerKid
  include Shout
end

angry_soccer_mom = SoccerMom.new
angry_soccer_mom.yell_angrily 'Oh come on ref'
happy_soccer_kid = SoccerKid.new
happy_soccer_kid.yell_happily 'Woohoo'
