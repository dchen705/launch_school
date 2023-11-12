18:49
- I jumped straight into algo, largely skipped the PED, stumbled a little at
implementation trying to use String#delete on an array object.
Stumbled with range type conversion -> can''t convert range to string

# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.


# double_consonants('String') == "SSttrrinngg"
# double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# double_consonants("July 4th") == "JJullyy 4tthh"
# double_consonants('') == ""

# ==============================

# Problem:
#   Restated
#     - given string, output a new string (only consonants are doubled)

#   Rules/Requirements
#     - Consonants are doubled - includes both upper and lower cases
#     - empty string input returns empty string
  
# Data Structure

#   (input) String ->
#   array containing a..z and A..Z - remove the vowels
#   (output) new string

# Algorithm

#   Thoughts
#     Approach 1
#     - create a selection criteria within a conditional statement to selectively double consonants only
#       - array of characters (remove the vowels)
    
#     Approach 2:
#     - double every character
#     - selectively remove 1 of 2 adjacent characters that are not consonants 
  
#   Language Toolbox
#   - Convert range of chracters into an array using
#   - Use the #delete method to remove Vowels
#   - use Array#include? for selective doubling

#   Approach 1 Algo: 
#     - Set `consonants` equal to 'A'..'Z' + 'a'..'z'
        # - Convert array then to string
#       - Delete vowels (upper and lower case) from `consonants`
        # - Convert back to array
#     - Set `doubled_consonants` to ''
#     - Iterate every character of input str, set `char` to character iterated over
#       - If char is included in `consonants`
#       `doubled_consonants` << char * 2
#        else
#         `doubled_consonants` << char

# ==============================

def double_consonants(str)
  consonants = ('A'..'Z').to_a + ('a'..'z').to_a
  consonants = consonants.join.delete('aeiouAEIOU').split('')
  return_str = ''
  str.each_char do |char|
    if consonants.include?(char)
      return_str << char * 2
    else
      return_str << char
    end
  end
  return_str
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""


# ==============================

# The way Ans Key did it seemed simpler.

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end

# Refactoring mine w/ ans key inspiration
def double_consonants(str)
  consonants = ('A'..'Z').to_a + ('a'..'z').to_a
  consonants = consonants.join.delete('aeiouAEIOU').split('')
  return_str = ''
  str.each_char do |char|
    return_str << char
    return_str << char if consonants.include?(char)
  end
  return_str
end

# Refactoring can just use reduce or with_object
def double_consonants(str)
  letters = ('A'..'Z').to_a + ('a'..'z').to_a
  consonants = letters.join.delete('aeiouAEIOU').split('')
  str.each_char.with_object('') do |char, doubled_str|
    doubled_str << char
    doubled_str << char if consonants.include?(char)
  end
end


# ================

Other students:

consonants = ('A'..'Z').to_a + ('a'..'z').to_a - 'AIEOUaieou'.chars

def double_consonants(str)
  str.chars.map do |char|
    CONSONANTS.include?(char) ? char * 2 : char
  end.join
end

def double_consonants(str)
  str.chars.map { |char| char.match?(/[b-df-hj-np-tv-z]+/i) ? char*2 : char }.join
end