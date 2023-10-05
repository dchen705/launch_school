# Write a method that counts the number of occurrences of each element in a given array.

# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.


# # ====================================

# Problem

#   Requirements / Rules
#     - assume input array element datatype is any datatype?
#     - words are case-sensitive
#     - print unique element occurences and their counts of occurences next to them

#   Edge Cases
#     test case only used strings

# Data Structure

#   (input) array ->
#   hash ->
#   (output)
  
#   OR

#   (input) array ->
#   array ->
#   (output)
#   ^ harder

# Algorithm

#   Approach 1: manual count into hash per iteration
  
#   Approach 2: method call to get new array of unique elements, iterate over unique elements array along with count method of arrays to make hash  

#     Does array#count exist and work as expected?
#     yes.
  
#   Approach 3: similarly to 1 or 2 but use a nested array instead of hash 
#     (more tedious)

# ====================================

# Approach 2:

# def count_occurrences(arr)
#   counts_hash = arr.uniq.each_with_object({}) do |ele, hash|
#     hash[ele] = arr.count(ele)
#   end
#   counts_hash.each { |k, v| puts "#{k} => #{v}"}
# end

# Approach 1
# def count_occurrences(arr)
#   counts_hash = arr.each_with_object({}) do |ele, hash|
#     if hash.key?(ele)
#       hash[ele] += 1
#     else
#       hash[ele] = 1
#     end
#   end
#   counts_hash.each { |k, v| puts "#{k} => #{v}"}
# end


# ====================================

# Further Exploration

# Try to solve the problem when words are case insensitive, e.g. "suv" == "SUV".

# def count_occurrences(arr)
#   same_case_arr = arr.map { |ele| ele.class == String ? ele.downcase : ele}
#   counts_hash = arr.uniq.each_with_object({}) do |ele, hash|
#     hash[ele] = arr.count(ele)
#   end
#   same_case_counts = counts_hash.each do |k, v|
#     if ele.class == String
#       if counts_hash.key?(ele.downcase)
      
#       else
        
#       end
#     else
#       same_case_counts[k] = v
#     end
    
#   end
#   counts_hash.each { |k, v| puts "#{k} => #{v}"}
# end

# # why i'm struggling is I don't want to force all the keys to lowercase if there's no duplicate element,
# # ie: i want to keep SUV as SUV if there's only 1.

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)

# ====================================

# other students:

# def count_occurrences(array)
#   array.map(&:downcase).tally.each { |type, count| puts "#{type} => #{count}" }
# end

def count_occurrences(array)
  hash = array.each_with_object(Hash.new(0)) do |element, hash|
    hash[element.downcase] += 1
  end
  hash.each {|k,v| puts "#{k} => #{v}"}
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

#  both students just downcased indiscriminately to create case insensitivity

def count_occurrences(vehicles)
  ret_hash = vehicles.uniq.zip(Array.new(vehicles.length, 0)).to_h
  # ^ what confused me was what happens when array#zip call for calling array and arg array have different lengths
  # in this case, arg array is longer (if there's dups), the elements of argument array with indices
  # greater than max index of the shorter calling array just get ignored / not included in return array.
  vehicles.each_with_object(ret_hash) { |vehicle, hash| hash[vehicle] += 1 }
  ret_hash.each { |k, v| puts "#{k} => #{v}" }
end

