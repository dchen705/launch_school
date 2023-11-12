# String#upcase! is a destructive method, so why does this code print HEY you instead of HEY YOU? Modify the code so that it produces the expected output.

def shout_out_to(name)
  name.chars.each { |c| c.upcase! } # change to name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

# Here, on line 6, part of the `puts` call output is the return value of `name` which is still the string value `you`. We can see a mutative `upcase!` method called on the `c` local block variable which is assigned to each element of the return value of `name.chars`. The issue is that the String#chars method returns a new array which is basically a completely different object from `name`, so we are mutating this new array produced by the `chars` method rather than the original `name` object. To fix, this we can simply remove the `chars` call and the `each` iteration call, and `upcase!` call directly on the string object referenced by `name`.

# Ans key
# specifically, we not only are mutating the array from name.chars but also the objects referenced in each element position within the array. 