# 11:00
# We wrote a method for moving a given number of elements from one array to another. We decide to test it on our todo list, but invoking move on line 11 results in a SystemStackError. What does this error mean and why does it happen?

def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n - 1, from_array, to_array) # if n - 1 > 0
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# SystemStackError suggests something's wrong with the call stack; when run in irb, we see that `move` calls are infinitely looped. The issue is that the `move` method is a recursive method that has no base case; in other words, no condition to stop calling itself after each consecutive call. 
# to fix this, add an if modifier

# Hint / Ans key

# In order to know where it needs to return to after finishing each of these calls, Ruby puts each call on a call stack. Since we never stop, this stack keeps growing and growing, until it exceeds its limit. This causes the SystemStackError - a real stack overflow!

# Further Exploration

# What happens if the length of the from_array is smaller than n?
# ^ Then eventually array#shift will be called on an empty array which will then get concatenated to the #to_array

# depending on how many elements n is larger than from_array, the difference in size will be the additional nils that fill up the to_array
# ie:
# move(6, todo, done)

# p todo # should be: []
# p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog', 'study', 'walk the dog', 'coffee with Tom', nil, nil, nil]
