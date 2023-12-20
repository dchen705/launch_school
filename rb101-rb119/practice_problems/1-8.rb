12:47
# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

This code will output 1 then 3. To better show, see below:

numbers = [1, 2, 3, 4]
numbers.each.with_index do |number, idx|
  p number, numbers, idx
  numbers.shift(1)
end

At iteration w/ idx 0
# 1
# [1, 2, 3, 4]
# 0
At iteration w/ idx 1
# 3
# [2, 3, 4]
# 1
Theoretically, at iteration w/ idx 2
`numbers` is only 2 elements long due to second Array#shift call.

The array#each method's first iteration checks the 0th position, outputs 0th position, then array#shift mutatively removes the first element which shifts all elements over one and array is only 3 elements now. On second iteration, the 1th position gets outputed which is now 3 instead of 2. Then 2nd array#shift called which reduced array to 2 element array which will not get iterated over in the 2th position, so iteration stops.

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

Here, first 1 then 2 is output. Iteration progressives normally, `number` gets assigned to 1 and 2 but after each output, an element at end gets deleted, 4, then 3 respectively such that a third iteration is no longer possible after the second array#pop call.

# Ans key:

From this we see that our array is being changed as we go (shortened and shifted), and the loop counter used by #each is compared against the current length of the array rather than its original length.

In both cases we see that iterators DO NOT work on a copy of the original array or from stale meta-data (length) about the array. They operate on the original array in real time.