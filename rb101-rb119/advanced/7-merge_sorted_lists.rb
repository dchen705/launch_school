# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

given - 2 arrays already sorted
return - new array containing elements from both input arrays in sorted order

Rules/Requirements
  - must not sort the result array at the end; have to add elements from the 2 arrays
    in correct order
  - original input arrays must not be mutated

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

[1, 1, 3], [2, 2]

High abstract options
  - duplicate both arrays, then compare elements, remove the smallest
  
  - iterate through both arrays, compare elements, remove the smallest
  
Thoughts
  - since arrays already sorted, no need to compare the current element with the next element of the same array, we can assume the first element is smaller
  - so comparison is done between elements of each array
  
Approach
  - initialize 2 counters to track each array's current element
  - until counter 1 >= size 1 || counter 2 > = size 2
  - if current element 1 <= current element 2
    - concat current element 1 to return_arr
    - increment counter 1 by 1
  else
    do opposite of above...
  end loop
  - counter 1 >= size 1, add from counter 2 to size2 - 1 
  - opposite for other one.
  
def merge(arr1, arr2)
  counter1 = 0
  counter2 = 0
  return_arr = []
  until counter1 >= arr1.size || counter2 >= arr2.size 
    current_ele1 = arr1[counter1]
    current_ele2 = arr2[counter2]
    if current_ele1 <= current_ele2
      return_arr << current_ele1
      counter1 += 1
    else
      return_arr << current_ele2
      counter2 += 1
    end
  end
  if counter1 >= arr1.size
    return_arr += arr2[counter2...arr2.size]
  else
    return_arr += arr1[counter1...arr1.size]
  end
end
  
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

# =========================
ANS KEY:

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

^ Same high level approach of 2 pointers to track each separate array and comparing
element between each array and concatenating depending on which lower
But they used an iterative method #each and it's block parameter to be one pointer
making it look more consise cuz the counter and increment is built and hidden in
the each syntax.

# ====================
Other students
came up with some interesting high level approaches

1) concatenate the arrays together, find the max, iterate from 1 to max via range
then count num and concatenate num to return array

2) concatenate arrays together, delete one by one element and concatenate to 
return array, deletion is by index of the minimum element (handles duplicates
cuz index() only returns first occurence.)

^ these students worked around the rule of no sorting by using methods
that have built in sort (max and min.)

3) more concise way of what i did:
def merge(arr1, arr2)
  result = []
  index1 = 0
  index2 = 0
  while index1 < arr1.length || index2 < arr2.length do
    return result + arr2[index2..-1] if index1 == arr1.length
    return result + arr1[index1..-1] if index2 == arr2.length
    if arr1[index1] < arr2[index2]
      result << arr1[index1]
      index1 += 1
    else
      result << arr2[index2]
      index2 += 1
    end
  end
end