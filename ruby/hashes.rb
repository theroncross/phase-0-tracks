# client class
class Client
  attr_accessor :properties
  def initialize
    @properties = {
      name: '',
      email: '',
      budget: 0,
      theme: '',
      children: false,
      pets: false
    }
  end

  # public method for adding new client
  def onboard
    @properties.each_key { |property| update property }
    report
    fix
  end

  private

  # Prompt, and set answer as value in hash
  def update(property)
    old_value = @properties[property]
    print "#{property}: "
    user_value = gets.chomp
    @properties[property] =
      if boolean? old_value
        yes?(user_value)
      elsif old_value.is_a?(Fixnum)
        user_value.to_i
      else
        user_value
      end
  end

  # print the hash after all the questions are answered
  def report
    puts "Here's the information I have stored"
    @properties.each_pair { |key, value| puts "#{key.capitalize}: #{value}" }
  end

  # fix information, if needed, based on response
  def fix
    loop do
      puts "To update any information, type it's name. Otherwise, type 'none'."
      property = gets.chomp
      break if property == 'none'
      update property.to_sym
      report
    end
    puts "We're all done."
  end

  def boolean?(property)
    property.is_a?(TrueClass) || property.is_a?(FalseClass)
  end

  # convert yes/no to true/false
  def yes?(answer)
    answer.downcase[0] == 'y' ? true : false
  end
end
