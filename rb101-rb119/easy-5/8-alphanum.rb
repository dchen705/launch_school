# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# prob restated:
# return integers 1-19 in which their string representation are sorted in alphabetical order

# prompt gives us the strings to make an array of strings reps of integers
# before sorting the `strings_of_integers` array, we create hash where keys are the string represenation of integer and value is the integer itself so we can use the hash
# to easily create the new array of integers

def alphabetic_number_sort(arr)
strings_of_integers = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

int_strings_to_int = Hash.new("")
current_int = 0
strings_of_integers.each do |string|
  int_strings_to_int[string] = current_int
  current_int += 1
end

# alpha_sorted_int_strings = [strings_of_integers].sort

# ^ didn't sort alphabetically for some reason.
# refactored: figured out, i put the var in [] so sort just called on a one-element array.
alpha_sorted_int_strings = strings_of_integers.sort


alpha_sorted_int_strings.map { |int_string| int_strings_to_int[int_string]}
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# other student's... my approach but less bulky...
# array#zip lets you combine calling array with argument array by element.
# def alphabetic_number_sort(arr)
#   conv_hash = (0..19).zip(%w(zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen)).to_h
#   str_arr = arr.map { |num| conv_hash[num] }
#   str_arr.sort!.map { |num| conv_hash.values.index(num) }
# end

# ans key... good idea
# NUMBER_WORDS = %w(zero one two three four
#                   five six seven eight nine
#                   ten eleven twelve thirteen fourteen
#                   fifteen sixteen seventeen eighteen nineteen)

# def alphabetic_number_sort(numbers)
#   numbers.sort_by { |number| NUMBER_WORDS[number] }
# end

# other student's.. clever...
# ENGLISH_NUMBERS = %w(zero one two three four five six seven eight nine ten
#                     eleven twelve thirteen fourteen fifteen sixteen seventeen 
#                     eighteen nineteen)

# def alphabetic_number_sort(number_array)
#   number_array.sort do |num1, num2|
#     ENGLISH_NUMBERS[num1] <=> ENGLISH_NUMBERS[num2]
#   end
# ^ here #sort with block kinda has similar capabilities as #sort_by
# end

# yeah the signaling bell in the prompt is seeing the index
# of the array of words align with the words themselves, at index 0, element was "zero", etc...
# hash was unnecessary.
# my solution was bulkier cuz:
# 1) the hash creation
# straight up remove and rely on array only
# or use array#zip then #to_h

# 2) either using #sort_by or using #sort with block
# #sort is not just limited to comparing the elements, if you pass #sort a block with spaceship
# expression, it can 
# compare and sort by other criteria in this case the hash values which represented words.