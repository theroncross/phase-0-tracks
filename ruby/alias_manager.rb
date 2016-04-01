# Prompt for names until 'quit', add name/alias pairs to a hash, then print names and aliases
def prompt_for_alias
  real_name = ""
  aliases = {}
  p "To add an alias enter your real name. Type 'quit' when done."
  until real_name == "quit"
    real_name = gets.chomp
    if real_name == "quit"
      break
    else
      aliases[real_name] = create_alias(real_name)
    end
  end
  aliases.each { |name, new_alias| p "#{name}, a.k.a. #{new_alias}" }
end

# Swap the names, increment the letters, and return capitalized result
def create_alias(name)
  reversed_name =   str.split(' ').reverse.join(' ')
  aliased_array = reversed_name.chars.map { |letter| increment_letter(letter) }
  capitalize_all(aliased_array.join)
end

# Reverse the order of names
def reverse_names(str)
  str.split(' ').reverse.join(' ')
end

# Increment letters, vowels to next vowel, consonants to next consonant
def increment_letter(letter)
  vowels = ["a", "e", "i", "o", "u"]
  if vowels.include?(letter)
    vowel_idx = letter == "u" ? 0 : vowels.index(letter) + 1
    vowels[vowel_idx]
  elsif letter == " "
    letter
  else
    next_letter = letter == "z" ? "a" : letter.next
    vowels.include?(next_letter) ? next_letter.next : next_letter
  end
end

# Capitalize each name
def capitalize_all(str)
  cap_arr = str.split(' ').each { |word| word.capitalize! }
  cap_arr.join(' ')
end

prompt_for_alias