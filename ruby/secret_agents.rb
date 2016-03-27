# Encrypt method
# 1. get the first letter of the string
# 2. increase it by one position in the alphabet
# 3. concatenate the encrypted character into an encrypted string
# 4. move to the next letter in the string
# 5. repeat the step 2-3 with each letter in succession

# Decrypt method
# 1. find the index of the first letter of the encrypted string in the alphabet
# 2. find the character at that index - 1 in the alphabet
# 3. concatenate that character to an decrypted string
# 4. repeat for each character in the encrypted string

def encrypt(str)
  encrypted_str = ""
  str.downcase.each_char do |c|
    next_char =
      if c == 'z'
        'a'
      elsif c == ' '
        ' '
      else
        c.next
      end
    encrypted_str += next_char
  end
  encrypted_str
end

puts encrypt 'abc'
puts encrypt 'zed'


def decrypt(str)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  decrypted_str = ""
  str.downcase.each_char do |c|
    if c == ' '
      decrypted_str += ' '
    else
      index_in_alphabet = alphabet.index(c)
      decrypted_str += alphabet[index_in_alphabet - 1]
    end
  end
  decrypted_str
end

puts decrypt 'bcd'
puts decrypt 'afe'

puts decrypt(encrypt("The duck flies at midnight"))
#The return from the encrypt method is a string, that immediately gets passed
#to the decrypt method as an arugment. The return value from the decrypt method
#is then passed to puts.