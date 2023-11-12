# Our countdown to launch isn't behaving as expected. Why? Change the code so that our program successfully counts down from 10 to 1.

def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter) # change to counter = decrease(counter)
end

puts 'LAUNCH!'


# This code fails to countdown because calling `decrease(counter)` doesn't modify the `counter` variable initialized on line 7 as probably intended. Within `decrease`, line 4's expression can be rewritten as `counter = counter - 1`. Here, importantly `counter` is a a local method variable, an entirely different variable from that initialized on line 7. And the method variable `counter` is getting reassigned, and the return value of this reassignment is implicity returned by the `decrease(counter)` expression on line 11. To fix, we can simply assign that return value to `counter` in the scope outside the method definition.
# The concept demonstrated here is method mutatability: the Integer#+ method is called on `counter` on line 4; this method returns a new integer object and doesn't mutate the calling integer.

# Ans Key
# Advised remove the reassignment within the method definition - as is unneccessary.

# Further Exploration

# We specify 10 two times, which looks a bit redundant. It should be possible to specify it only once. Can you refactor the code accordingly?

def decrease(counter)
  counter - 1
end

counter = 10
until counter < 0
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'