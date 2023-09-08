# In this exercise, you will write a method named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise. Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.

# reflex algo, just ask if the two arguments are equal

# def xor?(bool1, bool2)
#   bool1 != bool2 ? true : false
# end

# ^ prob doesn't address when arg is not a boolean value
    
# answer key solution:
# !!((value1 && !value2) || (value2 && !value1))

an example of xor config is:
hm, something where only true 
if one is false and other is true...
rock paper scissors? - not tieing?
honestly don't know.

no xor shouldn't perform short circuit because it
needs ot make sure values 1 and values 2 are not both
truthy or falsy

ahhh this guy converts it to a boolean first
def xor?(exp1, exp2)
  !!exp1 == !!exp2 ? false: true
end 
