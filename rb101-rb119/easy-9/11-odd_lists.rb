~ 7 minutes
# given an input Array
# return a new array containing all elements from the input array that are in the odd nth (even index positions)

# Rules/Requirements
#   - empty array returns empty array

# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []
# oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

# Approaches
#   - iteratively select the elements from input array that have even indices

#   - use a loop construct w/ counter, and only concatenate to a return_array every other element.


def oddities(arr)
  arr.select.with_index do |_, idx|
    idx.even?
  end
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]


# Further exploration
def evens(arr)
  even_places = []
  index = 1
  while index < arr.size 
    even_places << arr[index]
    index += 2
  end
  even_places
end

p evens([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evens(['abc', 'def']) == ['def']
p evens([123]) == []
p evens([]) == []

# 2 additional ways
  # some ideas:
  # reject,partition - similar to select

  # reduce/each_with_object - similar to manual loop


def oddities(arr)
  arr.each_index.with_object([]) do |idx, odds|
    odds << arr[idx] if idx.even?
  end
end

# copy the array and delete every other element in the copy
# nvm shouldn't delete while iterating through collection cuz it screws up numbering.

# if there's a method that pairs up elements into nested arrays, then I transform the nested inner arrays into single arrays.

# [1,2,3,4].each_slice(2) do |pair|
#   p pair # outputs [1, 2] and [3, 4]
# end

def oddities(arr)
  arr.each_slice(2).map do |pair|
    pair.first
  end
end

# Other students

# I thought about doing this, but didn't know how to handle empty array case
# clever was to use triple dot to exclude the array.size

def oddities(array)
  (0...array.size).step(2).map { |idx| array[idx] }
end

# pretty sure, compact removes the nils in the array
def oddities(array)
  array.map.with_index { |ele, idx| ele if idx.even? }.compact
end

# apparently this a variant of step method?
def oddities(array) 
  0.step(array.size - 1, 2).map { |idx| array[idx] }
end