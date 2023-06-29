# def tricky_number
#   if true
#     number = 1
#   else
#     2
#   end
# end

# puts tricky_number

# no explicit return, last line to be evaluated in tricky_number is
# number = 1, that's a local initialization of number variable?
# what does that line return?

# is this a trick question?

# idk, let met take a guess. will it print true?

# im thinking number = 1 is inside the if statement, the last expression
# of tricky_number is the if statement, and on the docs, if expression's
# "result value" is the last value executed in the if expression. and true
# was executed by the if?

# Answer: prints 1

# I guess the last value executed by if expression
# was the variable assignment number = 1

# "variable assignment still returns the value that was assigned to the variable.
# It works the same as if the assignment wasn't even there."