# Case 1:
# name = 'Bob'
# save_name = name
# name = 'Alice'
# puts name, save_name

# prints out
# Alice
# Bob

# Case 2:
# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name

# prints out
# BOB
# BOB

# In both cases, two variables get assigned to the same string object intially.
# One can say they both reference, ie: "point to" the same object.
# In case 1, = is assigning name to point to a different string object while save_name
# remains pointing at the initial string object.
# In case 2, there is no reassigning of either variables to point to a different string object.
# The .upcase! method is mutating as suggested by the ! sign meaning the calling object itself is being changed.

# other people's explanation included object_id
# and memory addresses.