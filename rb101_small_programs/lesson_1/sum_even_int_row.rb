# DS:
# [
#   [2]
#   [4, 6]
#   [8, 10, 12]
#   …
# ]

# Algo:

# 1st pass
# create_integer_rows(integer) => 2D array and assign to var `integer_rows`
# `integer_rows`[integer].sum => sum of inputted integer row

# More detailed
# create_integer_rows(integer)
# ---
# set `integer_rows` var and assign to []
# set `incrementing_even_int` var and assign to 2

# iterate from 1 up to `integer`, set parameter to `row_num`
#   set row_arr = []
#   while row_arr.size < row_num
#     row_arr << `incrementing_even_int`
#     `incrementing_even_int` += 2
#   end loop
#   `integer_rows` << row_arr`
# return integer_rows

def sum_row_even_int(int)
  integer_rows = create_int_rows(int)
  integer_rows[int-1].sum
  # ^ correction: index is int-1
end

def create_int_rows(int)
  integer_rows = []
  incrementing_even_int = 2

  1.upto(int) do |row_num|
    row_arr = []
    while row_arr.size < row_num
      row_arr << incrementing_even_int
      incrementing_even_int += 2
    end
    integer_rows << row_arr
  end

  integer_rows
end

p sum_row_even_int(1)
p sum_row_even_int(2)
p sum_row_even_int(3)
# works...
