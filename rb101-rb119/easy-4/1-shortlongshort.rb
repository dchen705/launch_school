# Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

# Algorithm:
# 1) define method short_long_short that takes 2 string parameters
# 2) if `str1` is longer than `str2`, assign local variable `long` to `str1` object...

def short_long_short(str1, str2)
  # long, short = str1.length > str2.length ? (str1, str2) : (str2, str1) <- doesn't seem to work

  if str1.length > str2.length
    long, short = str1, str2
  else
    long, short = str2, str1
  end

  short + long + short
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# Design improvements/feedback:
# Here I create two local variables within the method definition that I think improves clarity but is it worth the extra memory cost?