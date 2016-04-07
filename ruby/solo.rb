# A class for a player in Munchkin the card game
# Includes name, items array, race, class, level, item level attributes
# Methods for kicking down a door, fighting, asking for help, and running
class Player
  attr_reader :level, :item_level, :name, :ally
  attr_accessor :race, :class

  def initialize(name)
    @name =       name
    @level =      1
    @items =      [Item.new]
    @item_level = update_item_level
    @race =       'human'
    @class
    @ally
  end

  def kick_down_door(monster)
    puts "#{@name} kicks down a door to find a...."
    puts "level #{monster.level} #{monster.name}"
  end

  def update_item_level
    @item_level = 0
    item_levels = @items.map(&:level)
    item_levels.each { |level| @item_level += level }
    @item_level += @level
  end

  def status_update
    puts "#{@name} is level #{@level} with an item level of #{@item_level}"
    puts "#{@name} has the following items:"
    @items.each { |item| puts "Level #{item.level} #{item.name}" }
  end

  def fight_alone(monster)
    if @item_level > monster.level
      puts 'Monster down. Take your treasure!'
      take Item.new
      @level += 1
    else
      puts 'Better try to get an (ally) and come back, or (run) away.'
    end
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

  def ask_for_help(ally)
    puts "Hey #{ally.name}, want to help me out here? (y/n)"
    @ally = gets.chomp == 'y' ? ally : nil
  end

  def take(gear)
    puts "You found a level #{gear.level} #{gear.name}for your #{gear.slot}."
    current = @items.find { |item| item.slot == gear.slot }
    if current.nil?
      @items << gear
    else
      puts "Do you want to discard your level #{current.level} #{current.name}?"
      response = gets.chomp
      return if response != 'y'
      @items.delete_if { |item| item.slot == gear.slot }
      @items << gear
    end
  end

  def run_away
    get_away_if = @class == 'Thief' ? 4 : 5
    run_score = Random.rand(1..6)
    puts "#{@name} rolled a #{run_score}."
    if run_score >= get_away_if
      puts 'Whew! That was close'
    else
      puts 'Uh oh, bad stuff...'
      @level -= 1
    end
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
    @level = Random.rand(1..4)
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

20.times do
  players.each do |player|
    player.status_update
    monster = Monster.new
    player.kick_down_door(monster)
    puts 'What do you want to do? You can (fight), (ally), or (run)'
    fight_choice = gets.chomp
    if fight_choice == 'fight'
      player.fight_alone(monster)
    elsif fight_choice == 'ally'
      puts 'Who would you like to ask for help?'
      ally_name = gets.chomp
      ally = players.find { |buddy| buddy.name == ally_name }
      player.ask_for_help(ally)
      player.ally ? player.fight_with_ally(monster) : player.run_away
    else
      player.run_away
    end
    player.update_item_level
  end
end
