# Virus Predictor

# I worked on this challenge [with Walter].
# We spent [2] hours on this challenge.

# EXPLANATION OF require_relative
# Having the code from another file being avaliable in this file.
# require_relative works if your in the same folder or directory, as require would work for files that are outside the directory or folder.
require_relative 'state_data'

# Class for predicting virus effects
class VirusPredictor
  # Declares the instance variable and sets them to the arguments
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # Calls private helper methods
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

  # Predicts number of deaths based on density and prints a string.
  def predicted_deaths
    # predicted deaths is solely based on population density
    number_of_deaths = 0
    density_deaths = { '200' => 0.4,
                       '150' => 0.3,
                       '100' => 0.2,
                       '50'  => 0.1,
                       '0'   => 0.05 }
    density_deaths.each do |density, rate|
      if @population_density >= density_deaths[density].to_i
        number_of_deaths = (@population * rate).floor
      end
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
  end

  # Calculates and prints time of spread in months using population density
  def speed_of_spread
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0
    density_speed = { '200' => 0.5,
                      '150' => 1,
                      '100' => 1.5,
                      '50'  => 2,
                      '0'   => 2.5 }
    density_speed.each do |density, rate|
      speed += rate if @population_density >= density.to_i
    end

    puts " and will spread across the state in #{speed} months.\n\n"
  end
end

#=======================================================================

# DRIVER CODE
# initialize VirusPredictor for each state
STATE_DATA.each_key do |state_name|
  VirusPredictor.new(state_name, STATE_DATA[state_name][:population_density], STATE_DATA[state_name][:population]).virus_effects
end

#=======================================================================
# Reflection Section
# What are the differences between the two different hash syntaxes shown in the state_data file?
# The string/hash rocket notation is nice when you'll be interpolating the keys into strings or you have multi-word keys, like North Dakota. Using symbols for keys is arguably easier to read and faster, but doesn't work well for multi-word keys.

# What does require_relative do? How is it different from require?
# Require_relative looks for the other file relative to the location that it is being called from. This is useful for any files that will have the same file structure later. Require needs a complete path, and is useful when you are requiring files from outside sources, such as the internet.

# What are some ways to iterate through a hash?
# Hash iterators include iterating through each key, value, or key value pair. These determine which values will be passed in to the block parameters.

# When refactoring virus_effects, what stood out to you about the variables, if anything?
# Making instance variables significantly reduces the number of parameters required.

# What concept did you most solidify in this challenge?
# I think private methods make more sense now, though I don't feel like I'd always have a good sense of when to make a method private and when to make it public.
