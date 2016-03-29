# create a hash with keys and nil values
$client = {
  name: "",
  email: "",
  age: 0,
  theme: "",
  vacation: "",
  children: false,
  pets: false
}

# update about each of the keys in the hash
def new_info
  $client.each_key { |property| update property }
  report
  fix
end

# Prompt, and set answer as value in hash
def update(property)
  print "#{property.to_s.capitalize}: "
  user_value = gets.chomp
  stored_value = nil
  if $client[property].is_a?(TrueClass) || $client[property].is_a?(FalseClass)
    stored_value = yes?(user_value)
  elsif $client[property].is_a?(Fixnum)
    stored_value = user_value.to_i
  else
    stored_value = user_value
  end
  $client[property.downcase.to_sym] = stored_value
end

# print the hash after all the questions are answered
def report
  puts "Here's the information I have stored"
 $client.each_pair { |key, value| puts "#{key.capitalize.to_s}:   #{value}" }
end

# fix information, if needed, based on response
def fix
  property = nil
  until property == "none"
    puts "To update any information, type it's name. Otherwise, type 'none'."
    property = gets.chomp
    if property == "none"
      break
    else
      update property.downcase.to_sym
      report
    end
  end
  puts "We're all done."
end

# convert yes/no to true/false
def yes?(answer)
  answer.downcase[0] == 'y' ? true : false
end

new_info