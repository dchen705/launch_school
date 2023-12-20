10:47


# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

# Algorithm

#   High-Level Approaches
#   - Convert string to Array, iterate and build hash
#   - Convert string to array, use Array#tally, then select for letter keys only

#   Steps
#     - Convert string to Array, `char_arr`
#     - Set new hash, initialze new value to 0
#     - Iterate over Array, set `char` to element iterated over
#       - if `char` included in ('A'..'Z').to_a + ('a'..'z').to_z
#         - `hsh`[`char`] += 1

# LETTERS = ('A'..'Z').to_a + ('a'..'z').to_a

# Approach A: 
# p (statement.split('').each_with_object(Hash.new(0)) do |char, hsh|
#   hsh[char] += 1 if LETTERS.include?(char)
# end)

# Approach B: 
# p (statement.split('').tally.select { |k, v| LETTERS.include?(k) })

# APPROACH ANS KEY

# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a

# letters.each do |letter|
#   letter_frequency = statement.count(letter)
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# p result

# Ans key iterated over each letter rather than string. which is better? 
# I guess it probably depends on how long the string is.
 # honestly not sure.