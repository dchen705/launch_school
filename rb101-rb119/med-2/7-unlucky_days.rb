15 min (w/o FE)
# given - a int representing the year
# return - int that represents number of months in which 13th is a Friday

# rules/requirements
#   - input year is greater than 1752 (assuming we will use the mondern Gregoarian calender)



# friday_13th(2015) == 3
# friday_13th(1986) == 1
# friday_13th(2019) == 2

# Thoughts

# DS intermed pathway

# figure out how to initialize date then iterate each month
# format of Date.new(year, month, day)
# iterate from (1..12), set `month` - reduce method running total of friday 13s
#   Date.new(year, month, 13).friday?

# High Abstract Summary
# - for the given year, iterate through every month, check if the 13th of that month is a Friday and increment +1 a counter
#   Low lvl algo
#     - given `year`
#     - iterate by `month` from (1..12) reducing a `count` of friday the 13ths initialized at 0
#     Date.new(year, month, 13).friday? ? count += 1 : count
 
require 'date'
def friday_13th(year)
  (1..12).reduce(0) do |count, month|
    Date.new(year, month, 13).friday? ? count += 1 : count
  end
end
p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# tips
# - use class.instance_methods(false)
# - realized date didn''t exist, had to add its
#   - require 'date'
# then date.instance_methods(false)

Further Exploration

An interesting variation on this problem is to count the number of months that have five Fridays. This one is harder than it sounds since you must account for leap years.

what is a leap year?

High abstract Summary
iterate every month, within month, iterate every day, count the friday sof that month, if 5, increment the main counter by 1
===
start on first friday of year, start count, skip one week, if same month and year, increment count +1, otherwise, check if count is 5 then add +1 to main counter