~1 hour 7 minutes, took me awhile to figure out how to get around the time out error. 

what finally helped was I wrote out an edge case like this:
[0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5], 10
and thought what algo I could use to more efficiently solve this problem.
rather than repeatedly iterating over duplicates of the left, I''d just use a separate array containing only uniq values on left side and would simply skip concating new values to this separate array if already existed in it.

given - a list of integers, an integer representing a sum value
return - a pair of integers in array form, 
  this pair contains 2 integers belonging to the array that add up to the sum vanlue Integer

rules/requirements
- if multiple pairs, return the pair in which the 2nd element index is the smallest of all pairs
- if no pairs add up to sum, then return nil

sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * the correct answer is the pair whose second value has the smallest index
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== None/nil/undefined (Based on the language)

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * the correct answer is the pair whose second value has the smallest index
== [3, 7]

ds intermed pathway
[4, 3, 2, 3, 4], 6

(1...arr.size).each do |second_idx|
  (0...second_idx).each do |first_idx|
    return [first ele, second_ele] if first + second == sum

reverse_each.with_index -> second_ele, start_idx -> 4, 3, 2, 3.
  arr[0..(start_idx - 1). reverse_each  


[4, 3] [4, 2] [4, 3] [4, 4]
[3, 2] [3, 3]

# nested iteration, for a total of 2 pointers
# top level pointer - 2nd element - or start at index size - 1 iterate in reverse to 0. or jsut do reverse_each
# inner pointer - 1st element - reverse iterate from left side subarray slice starting from 2_element_idx - 1

algo
- given array of integers, and an integer, `sum`
- iterate from (1...arr.size) whcih represenets the index of second element, `second_idx`
    - iterate from (0...second_idx), `first_idx`
      return [first ele, second_ele] if first + second == sum


def sum_pairs(arr, sum)
  (1...arr.size).each do |second_idx|
    (0...second_idx).each do |first_idx|
      return [arr[first_idx], arr[second_idx]] if arr[first_idx] + arr[second_idx] == sum
    end
  end
  nil
end

Other failed variations:
# Thought:
# there is only 1 viable number for each number that add up to sum

# def sum_pairs(arr, sum)
#   (1...arr.size).each do |second_idx|
#     second_element = arr[second_idx]
#     if arr[0...second_idx].any? do |first_element|
#       sum - second_element == first_element
#     end
#       return [sum - second_element, second_element]
#     end
#   end
#   nil
# end

# def sum_pairs(arr, sum)
#   (1...arr.size).each do |second_idx|
#     arr[0...second_idx].uniq.each do |first_element|
#       second_element = arr[second_idx]
#       return [first_element, second_element] if first_element + second_element == sum
#     end
#   end
#   nil
# end

p sum_pairs([4, 3, 2, 3, 4], 6)

no variation of nested iteration can handle very long arrays.

[0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5]

^ two things we can do:
  first instead of checking [0, 0, 0, 0], we should just check [0]

  so instead of matching second element to a entire iteration, just only iterate over unique values

def sum_pairs(arr, sum)
  left_uniq = [arr[0]]
  (1...arr.size).each do |second_idx|
    second_element = arr[second_idx]
    if left_uniq.any? { |first_element| first_element = sum - second_element}
      return [sum - second_element, second_element]
    end
    next if left_uniq.include?(first_element)
    left_uniq << first_element
  end

end


def sum_pairs(arr, sum)
  left_uniq = [arr[0]]
  (1...arr.size).each do |second_idx|
    second_element = arr[second_idx]
    if left_uniq.any? { |first_element| first_element == sum - second_element}
      return [sum - second_element, second_element]
    end
    next if left_uniq.include?(second_element)
    left_uniq << second_element
  end
end

p sum_pairs([4, 3, 2, 3, 4], 6)

def sum_pairs(arr, sum)
  left_uniq = [arr[0]]
  (1...arr.size).each do |second_idx|
    second_element = arr[second_idx]
    if left_uniq.any? { |first_element| first_element == sum - second_element}
      return [sum - second_element, second_element]
    end
    next if left_uniq.include?(second_element)
    left_uniq << second_element
  end
  nil
end

# Refactored
def sum_pairs(arr, sum)
  arr[1..-1].each_with_object([arr[0]]) do |second_value, first_values|
    if first_values.include?(sum - second_value)
      return [sum - second_value, second_value]
    else
      first_values.include?(second_value) ? next : first_values << second_value
    end
  end
  nil
end

# using reduce (memo)

def sum_pairs(arr, sum)
  arr[1..-1].reduce([arr[0]]) do |first_values, second_value|
    if first_values.include?(sum - second_value)
      return [sum - second_value, second_value]
    else
      first_values.include?(second_value) ? first_values : first_values << second_value
    end
  end
  nil
end

Other''s very clean idea:

def sum_pairs(ints, s)
  seen = {}
  for i in ints do
    return [s-i, i] if seen[s-i]
    seen[i] = true
  end
  nil
end