def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Examples

find_first_nonzero_among(0, 0, 1, 0, 2, 0)
find_first_nonzero_among(1)

# # first glance: only 1 parameter for the method
# but they added a bunch of arguments. The
# numbers should be bunched in one datatype like
# an array.

# # 1-read_error.rb:1:in `find_first_nonzero_among': wrong number of arguments (given 6, expected 1) (ArgumentError)
#         from 1-read_error.rb:9:in `<main>'
        
# # yup

# also another error occurs when .each tries
to get called on 1... 