# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

# def ascii_value(str)
#   ascii_sum = 0
#   for char in str.chars
#     ascii_sum += char.ord
#   end
#   ascii_sum
# end

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

# Other way:
# def ascii_value(str)
#   ascii_array = []
#   chars_array = str.chars
#   ascii_array << chars_array.shift.ord until chars_array.empty?
#   ascii_array.sum
# end

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

# Other way:
# def ascii_value(str)
#   str.chars.reduce(0) do |ascii_sum, char|
#     ascii_sum += char.ord
#   end
# end

# or
def ascii_value(str)
  str.chars.reduce(0) { |ascii_sum, char| ascii_sum += char.ord}
end


p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further exploration:
# char.ord.mystery == char 
# ->
# char.ord.chr == char => true
# 'Four score'.ord.chr => 'F'

# Also:
# 'Four score.chr' => 'F'
# 'Four score.ord' => 70
# Instead of raising an error, `chr` and `ord` methods invoked on a multi-character string
# returns the first character or first character's ordinal/ASCII value respectively.

# # Other student
# char.ord.chr == char 
# => false if char is multicharacter string