# A class for a player in Munchkin the card game
# Initialize with instance variables for:
#   name, passed in at instantiation,
#   level, defaults to one,
#   items array, with one new item,
#   item level, calculated with the update item level methods
#   ally, default to nil
# Instance methods for
#   DEFINE kicking down a door, pass in a monster object
#     PRINT 'you found a monster'
#     RETURN a goofy string
#   DEFINE fighting a monster alone, pass in a monster object
#     IF players item level is higher than the monster
#       PRINT a string
#       PUSH a new item to the items array
#       Increment player level
#     ELSE
#       PRINT a string
#       Decrement player level
#     RETURN the new player level
#   DEFINE running away
#     Get a random number from 1 to 6
#     IF the number is higher than 4
#       PRINT something about getting away
#     ELSE
#       PRINT something negative
#       Decrement player level
#   DEFINE asking for help, pass in another player object
#     PRINT a message for the player you're asking
#     IF they agree to help, set that player as ally
#     ELSE Set ally to nil
#   DEFINE fighting a monster with an ally, pass in a monster object
#     IF the sum or yours and your ally's ILs are higher than the monster
#       PRINT something good
#       Ally takes an item
#       Increment player level
#     ELSE
#       PRINT some bad news
#       player and ally both passed run away method
#   DEFINE take, pass an item object
#     PRINT a line saying what you got
#     Find the item you currently have in that slot in items array
#     UNLESS that slot is NIL
#       Prompt the user to see if they want to replace the old item
#       RETURN if no
#       Otherwise, DELETE the old item
#     PUSH the new item into the items array
#   DEFINE calculating item level
#     Reset item level to 0
#     Iterate through the items array, mapping the levels of each item
#     Iterate through the mapped array, summing the levels
#     RETURN the total
#   DEFINE status update
#     PRINT the player's name, level, and item level
#     Iterate through the items array PRINTing each item
class Player
  attr_reader :name, :level, :item_level

  def initialize(name)
    @name =       name
    @level =      1
    @items =      [Item.new]
    @item_level = update_item_level
    @ally
  end

  def kick_down_door(monster)
    puts "#{@name} kicks down a door to find a...."
    puts "level #{monster.level} #{monster.name}"
    'Wow does it stink in here!'
  end

  def fight_alone(monster)
    if @item_level > monster.level
      puts 'Monster down. Take your treasure!'
      take Item.new
      update_item_level
      @level += 1
    else
      puts 'You chose...poorly.'
      @level -= 1
    end
  end

  def run_away
    run_score = Random.rand(1..6)
    puts "#{@name} rolled a #{run_score}."
    if run_score >= 5
      puts 'Whew! That was close'
    else
      puts 'Uh oh, bad stuff...'
      @level -= 1
    end
    @level
  end

  def ask_for_help(ally)
    puts "Hey #{ally.name}, want to help me out here? (y/n)"
    @ally = gets.chomp == 'y' ? ally : nil
  end

  def fight_with_ally(monster)
    if @item_level + @ally.item_level > monster.level
      puts "Together you defeat the monster. #{@ally.name} gets treasure!"
      @ally.take Item.new
      @level += 1
    else
      puts 'The monster is too much. Run away!'
      run_away
      @ally.run_away
    end
    @ally = nil
  end

  def take(gear)
    puts "You found a level #{gear.level} #{gear.name} for your #{gear.slot}."
    current = @items.find { |item| item.slot == gear.slot }
    unless current.nil?
      return unless discard?(current)
    end
    @items << gear
  end

  def discard?(current)
    puts "Discard your level #{current.level} #{current.name}? (y/n)"
    response = gets.chomp
    return fasle if response == 'n'
    @items.delete_if { |item| item.slot == gear.slot }
    true
  end

  def update_item_level
    @item_level = 0
    item_levels = @items.map(&:level)
    item_levels.each { |level| @item_level += level }
    @item_level += @level
    @item_level
  end

  def status_update
    puts "#{@name} is level #{@level} with an item level of #{@item_level}"
    puts "#{@name} has the following items:"
    @items.each { |item| puts "Level #{item.level} #{item.name}" }
    @level
  end
end

# Monsters have names and levels
class Monster
  attr_reader :level, :name

  def initialize
    @level = Random.rand(5..15)
    @name = %w('Medusa' 'Squidzilla' 'Scrooge').sample
  end
end

# Items have names and levels
class Item
  attr_reader :name, :level, :slot

  def initialize
    @name = ['Durendal', 'Eleven Foot Pole', 'Aluminum Foil'].sample
    @level = Random.rand(1..3)
    @slot = [:feet, :chest, :head, :weapon].sample
  end
end

players = []
puts 'How many players are there?'
i = gets.chomp.to_i
i.times do |player_number|
  puts "Player #{player_number + 1}, what is your name?"
  player_name = gets.chomp
  players << Player.new(player_name)
end

players.each(&:status_update)

10.times do
  players.each do |player|
    player.status_update
    monster = Monster.new
    player.kick_down_door(monster)
    player.fight_alone(monster) if @item_level > monster.level
    puts 'What do you want to do? You can (fight), (ally), or (run)'
    fight_choice = gets.chomp
    case fight_choice
    when 'fight'
      player.fight_alone(monster)
    when 'ally'
      puts 'Who would you like to ask for help?'
      ally_name = gets.chomp
      ally = players.find { |buddy| buddy.name == ally_name }
      player.ask_for_help(ally)
      player.ally ? player.fight_with_ally(monster) : player.run_away
    else
      player.run_away
    end
  end
end
