# Fix errors for below:
# def dog
#   return name
# end

# def cat(name)
#   return name
# end

# puts "The dog's name is #{dog('Spot')}."
# puts "The cat's name is #{cat}."

# just reading it...name wasn't initialized in dog method, guessing need to 
# add name parameter and pass dog's name into it as argument
# for the cat method call, it didn't include the argument which is required
# as defined.


def dog(name)
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat('Ginger')}."