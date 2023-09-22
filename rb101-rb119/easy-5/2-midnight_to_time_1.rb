# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.


# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

# Problem:
  
#   CONCEPTS:
#   Units of time
#   Restart Limits: MM at :60, HH at 24:00
#     Increment 1 HH when MM resets from 60 -> 0
#   Directional:
#     Positive Integer
#     vs
#     Negative Integer
    
#   QUESTIONS:
#     how many minutes in 24 hours? 
#       1440 
      
#   Statements:
#   input integer represents total number of minutes
    
# Explicit
  
# Implicit

# Algorithm:
# Treat the input integer as a decrementing total?

# If integer >= 0
# then
#   determine num of hours and remaining minutes derived from integer

# First Case Boundary:
# input integer is non-negative and between 0 and 1439
# Divide integer by 60 and assign dividend to `num_of_hours` var and remainder to `remaining_min` var respectively
# Divide `num_of_hours` var by 24 and assign remainder to `remaining_hours`
# Format `remaining_hours` and `remaining_min`

# Second Case Boundary: 
# input integer is negative
# # Divide integer by 60 and assign dividend to `num_of_hours` var and remainder to `remaining_min` var respectively
# # Divide `num_of_hours` var by 24 and assign remainder to `remaining_hours`
# Subtract `remaining_hours` from 24 and reassign to `remaining_hours`
# Subtract `remaining_min from 60 and reassign to remaning_min`


# Code:
# def time_of_day(int)
#   num_of_hours, remaining_min = (int >= 0)? int.divmod(60) : (-int).divmod(60)
#   remaining_hours = num_of_hours % 24
#   if int < 0
#     remaining_min = 60 - remaining_min
#     remaining_hours = 24 - remaining_hours - 1
#   end
#   format_hh_mm(remaining_hours, remaining_min)
# end

# def format_hh_mm(hours, minutes)
#   "#{sprintf('%02d', hours)}:#{sprintf('%02d', minutes)}"
# end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

# Reflection:
# Thoughts that helped
# distinguishing between solving problem abstractly vs coding implementation
# not treating pedac as unilinear

# Hmm, even though so little code, coming up with solution still took me 45 ish minutes

# Answer key's solution:
# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

# def normalize_minutes_to_0_through_1439(minutes)
#   while minutes < 0
#     minutes += MINUTES_PER_DAY
#   end

#   minutes % MINUTES_PER_DAY
# end

# def time_of_day(delta_minutes)
#   delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
#   hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
#   format('%02d:%02d', hours, minutes)
# end

# The fact that delta_minutes can be outside the range 0-1439 minutes makes this problem more complex than it seems. However, if you think about the problem for a few minutes, you may realize that there is something we can do to make our job easier. We can normalize the number of minutes so that we only have to deal with values that are positive but less than a full day: 0-1439.

# Consider for instance, the time of day 3 minutes before midnight (delta_minutes == -3). That's the same time of day as 1437 minutes after midnight (MINUTES_PER_DAY - 3 == 1437). On the other hand, the time of day 1443 minutes past midnight is the same as the time of day 3 minutes past midnight (1443 - MINUTES_PER_DAY == 3). The #normalize_minutes_to_0_through_1439 method restricts each argument to this range without changing the expected results.

# ^ So, he realized that it was easier to convert the time to HH:MM format if the minutes
# were between 0 and 1439.
# Since time is cyclical, can simply divide minutes (if positive) by 60 * 24 (or 1440)

# Handling negative minutes seems tricky but he realized that adding +1440 returns the same
# HH:MM.
# So just keep adding +1440 and stop immediately once positive so value is between 0 and 1439.

# Question 1: try to normalize using % in a single calculation allowing for negative numbers

# MIN_PER_HR = 60
# HR_PER_DAY = 24
# MIN_PER_DAY = 1440

# def recalculate_min_to_0_to_1439(minutes)
#   minutes % MIN_PER_DAY
# end

# def time_of_day(minutes)
#   normalized_minutes = recalculate_min_to_0_to_1439(minutes)
#   remaining_hours, remaining_minutes = normalized_minutes.divmod(MIN_PER_HR)
#   "#{sprintf('%02d', remaining_hours)}:#{sprintf('%02d', remaining_minutes)}"
# end

# Question 2: how would solve if allowed to use Date and Time class of Ruby?

# method hunted:
#hour and #min returns the hour and minutes based on time
#at returns a time based on integer...soo let's combine these methods

# def time_of_day(delta_min)
#   time = Time.at(delta_min)
#   "#{time.hour}:#{time.min}"
# end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

# Failed all test cases.

# def time_of_day(delta_min)
#   time = Time.at(delta_min)
#   puts "#{sprintf('%02d',time.hour)}:#{sprintf('%02d',time.min)}"
# end

# time_of_day(35) 
# => returns 00:00, so Time.at probably doesn't work the way i think?

# SECONDS_PER_MIN = 60

# def time_of_day(delta_min)
#   time = Time.at(delta_min * 60)
#   "#{sprintf('%02d',time.hour)}:#{sprintf('%02d',time.min)}"
# end

# p time_of_day(-4231)


# PASSED all test cases. Read docs. Time.at takes in seconds as argument.

# Question 3:
# How would you approach this problem if you were allowed to use ruby's Date and Time classes and wanted to consider the day of week in your calculation? (Assume that delta_minutes is the number of minutes before or after midnight between Saturday and Sunday; in such a method, a delta_minutes value of -4231 would need to produce a return value of Thursday 01:29.)

# Reflect algo:
# Reference docs to figure out the starting time and date of the Time.at() method.
# Then I can use a fixed constant value to efffectively offset starting time 00:00 to midnight between Sat and Sun
# Rest is just based off question 2 and method hunting whatever converts time to day.

# Method Tools:
# Time#wday returns 0-6, 0 == sunday

# Time.at(0).wday => 4
# Time.at(1).wday => 4
# Time.at(-1).wday => 3

# Time.at(0) is a Wednesday night
# w_day_offset should be 3

SECONDS_PER_MIN = 60
INT_TO_WDAY = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
# # I doubled array cuz lazy way of making sure offset of index doesn't get outta range.
W_DAY_OFFSET = 3

def calc_time_and_wday(delta_min)
  time = Time.at(delta_min * SECONDS_PER_MIN)
  "#{INT_TO_WDAY[time.wday + 3]} #{sprintf('%02d',time.hour)}:#{sprintf('%02d',time.min)}"
end


p calc_time_and_wday(-4231)

# failed...
# surprisingly, this algo passes the test cases, but it doesn't give what the answer key expects.

# I'm dumb, I misread as -4321 when it's actually -4231.
