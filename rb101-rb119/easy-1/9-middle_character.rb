# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

# reflex algo
# even/odd? ternatory to find midpoint
# be wary of int vs float calculation

def center_of(str)
  str.length.odd? ? str[str.length / 2] : str[(str.length / 2) - 1, 2]
end

puts center_of("Launch")
puts center_of("rux")

# string#[] lets us get substring
# remember if no explicit return, will return last statement
# need to account for index starts at 0, length starts at 1