# def count_sheep
#   5.times do |sheep|
#     puts sheep
#     if sheep >= 2
#       return
#     end
#   end
# end

# p count_sheep

# Hmm, not sure. I know program will print
# 0
# 1
# 2
# then if clause gets triggered which will return immediately the method
# but then is it the last line's return that gets printed because no 
# explicit value after the return statement?
# so the last evaluation of count_sheep was the times method and it will
# return the integer 5?

# so prints
# 0
# 1
# 2
# 5

# Yeah so it was actually
# 0
# 1
# 2
# nil

# made the wrong assumption but was aware of the uncertainty of my assumption.
# so a blank return statement will return nil.