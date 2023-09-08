# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

def uppercase?(str)
  char_array = str.split(//)
  char_array.each do |char|
    if char != char.upcase
      return false
    end
  end
  return true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# A key:
# wow could have just done this.
# def uppercase?(string)
#   string == string.upcase
# end

# having return false for empty string makes sense
# if we want to validate string is not empty.