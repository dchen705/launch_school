def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep

# shouldn't this cause an error because the sheep variable used to represent
# the iterator for the times method was never initialized?

# guess i forgot what the times method does...
# It's format is Integer#times
# so first iteration sheep = 0, then sheep = 2, etc....
# so prints like this
# 0
# 1
# 2
# 3
# 4
# 5
# ^ where did that 5 come from?
# admitedly, I thought:

# count_sheep returns nil since no return statement explicitly so last line of
# count_sheep is puts statement which returns nil which doesn't get printed by
# puts.

# In actuality, the last line isn't the puts in times method, technically
# last line of count_sheep is the .times method which returns the initial
# integer which is 5...this return attribute of times method can be found in the docs.