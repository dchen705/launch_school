# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

# gonna steal the mechanism from a prev q ans key that worked.

# Problem:
# original input string's consequetive duplicate characters get discluded from returned string

# Data Structure:
# (INPUT) string (1)->
# chars array (2)->
# no_consecutive_dup_chars arr (OUTPUT)

# Algorithms:
# (2)
#   iterate over chars array
#   Concatenate current char to output array unless chars_array.last == current char
  
def crunch(string)
  no_consecutive_dup_chars_arr = []
  string.chars.each do |char|
    no_consecutive_dup_chars_arr << char unless char == no_consecutive_dup_chars_arr.last
  end
  no_consecutive_dup_chars_arr.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''