# Prompt for names until 'quit', then print names and aliases
def prompt_for_alias
  real_name = ''
  aliases = {}
  loop do
    p "To get a new alias, enter your real name, or type 'quit'."
    real_name = gets.chomp.downcase
    break if real_name == 'quit'
    aliases[real_name] = create_alias(real_name)
  end
  aliases.each { |name, new_alias| p "#{name}, a.k.a. #{new_alias}" }
end

# Swap the names, increment the letters, and return capitalized result
def create_alias(name)
  reversed_name = name.split(' ').reverse.join(' ')
  aliased_array = reversed_name.chars.map { |letter| increment_letter(letter) }
  capitalize_all(aliased_array.join)
end

# Increment letters, vowels to next vowel, consonants to next consonant
def increment_letter(letter)
  vowels = %w('a', 'e', 'i', 'o', 'u', 'y')
  if vowels.include?(letter)
    vowels[letter == vowels.last ? 0 : vowels.index(letter) + 1]
  elsif letter == ' '
    letter
  else
    next_letter = letter == 'z' ? 'a' : letter.next
    vowels.include?(next_letter) ? next_letter.next : next_letter
  end
end

# Capitalize each name
def capitalize_all(str)
  cap_arr = str.split(' ').each(&:capitalize!)
  cap_arr.join(' ')
end

prompt_for_alias
