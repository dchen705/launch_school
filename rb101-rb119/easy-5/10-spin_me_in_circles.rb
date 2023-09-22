# You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# The returned string will be a different object than the input string.
# Even though we use a mutative method string#reverse, the mutative method is called
# on a new string because the #each method is iteratiing over the return value
# of the string#split method which is a array derived from the original string and this
# array has a different object id.