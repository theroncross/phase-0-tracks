# Swap the names, increment the letters, and return capitalized result
def create_alias(name)
  reversed_name = reverse_names(name)
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

p "What's your name?"
name = gets.chomp.downcase
p create_alias(name)