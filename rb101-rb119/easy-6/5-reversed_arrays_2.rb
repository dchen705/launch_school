# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

# def reverse(arr)
#   reversed_arr = []
#   (1..arr.length).each do |index|
#     reversed_arr << arr[-index]
#   end
#   reversed_arr
# end



# reverse_each is like each, except it processes the elements in reverse order. Note that unlike each, reverse_each only applies to Arrays.

# Further exploration: use #reduce or #each_with_object

def reverse(arr)
  reversed = arr.reduce([]) {|copy_arr, ele| copy_arr.unshift(ele)}
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true