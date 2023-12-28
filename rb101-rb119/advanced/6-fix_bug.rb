This exercise made me think more about reading code as how the parser
interprets code not how the code writer intends it

def my_method(array)
  if array.empty?
    []
  elsif #array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# ^ above comment is fixed code.

# the elsif expression was missing a condition which 
# also seemed to invalidate the rest of the branches of the if expression such that the method was returning
# nil as if neither of the branches after the first `if` was executed.

# ans key clarifies something important
"Anyway, that missing conditional expression on the elsif isn't really missing 
-- at least not as far as the ruby parser is concerned. When ruby gets to the 
end of the elsif line and doesn't find a conditional expression, 
it's smart enough to go looking for it on the next line. "

so ruby parser is treating the next expression following elsif as the condition.
and since it's a map call which returns a value (not nil), it will be truthy and 
evaluate and the if expression returns nil. So I kinda saw the solution but 
I was wrong in how parser interpreted the information.