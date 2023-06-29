# Write some code that selects 'fish' and 'lizard' from the pets array - select the two items at the same time. Assign the return value to a variable named my_pets, then print the contents of my_pets as a single string, e.g.:

pets = ['cat', 'dog', 'fish', 'lizard']

my_pets = Array.new
my_pets[0] = pets[2]
my_pets[1] = pets[3]

# my_pets = []
# my_pets = pets[2].push(pets[3])
# ^^^ doesn't work, my_pets is treated as a string. did i not intialize an array?


puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"

# # idk seems kinda redundant to put two elements in original array and 
# assign to new array then calling from new array
# vs just calling from the original array

# Answer Key:
# my_pets = pets[2..3]

# puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"

# i can use [..] to select a range of consequetive elements in an array