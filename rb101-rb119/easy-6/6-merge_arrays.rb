# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.


# Problem:

# Questions:
# what datatype are the array elements, integers only?

# Algo: just merge, sort and remove duplicates?



def merge(arr1, arr2)
  arr1.concat(arr2).uniq.sort
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# ans key:
# def merge(array_1, array_2)
#   array_1 | array_2
# end
# 
# def merge(arr1, arr2)
#   arr1.union(arr2)
# end