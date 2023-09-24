# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

# Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

# You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

# You may use this constant to represent the degree symbol:
# DEGREE = "\xC2\xB0"

# Problem

# Ruby syntax:
# what does %() refer to again? I've seen it used for arrays and strings like %w() and %q
# 3.2.2 > %(test)
# "test"
# ok, seems to alternative string delimiter syntax

# Data Structure
# (INPUT) float ->
# ('deg_min_sec_arr`) array of floats->
# (OUTPUT) string


# Output format:

# format requires rounded numbers

# Algorithm
# Functions/methods
#   1) calculate three numbers
#     2) round three numbers
#     3) format
  
# calculate_degree_min_sec()
#   get dividend and mod of float / float_to_i and assign to `degree` and `degree remainder` vars
#   get dividend and mod of `deg_remainder` * deg_to_min / (deg_remainder` * deg_to_min)_to_i and assign to `min` and `min_remainder` vars
#   get divident and mod of `min_remainder` * min_to_deg / float_to_i... etc..
  
#   ^ better approach:
  
# initialize 'deg_min_sec_arr`
# iterate over unit_factor_array, set parameter equal to unit_factor
#   float = float * unit_factor
#   whole, float = float.divmod(float.to_i)
#   'deg_min_sec_arr` << whole

# MIN_PER_DEGREE = 60
# SEC_PER_MIN = 60
# DEGREE = "\xC2\xB0"

# def dms(float)
#   dms_arr = []
#   unit_factor_arr = [1, MIN_PER_DEGREE, SEC_PER_MIN]
  
#   unit_factor_arr.each do |unit_factor|
#     float = float * unit_factor
#     whole, float = float.divmod(1)
#     dms_arr << whole
#   end
  
#   dms_arr.last.round(2)
  
#   dms_arr[1] = sprintf('%02d', dms_arr[1])
#   dms_arr[2] = sprintf('%02d', dms_arr[2])
#   # "#{dms_arr[0]}#{DEGREE}#{dms_arr[1]}\'#{dms_arr[2]}\""
#   # ^ \" doesn't escape..
#   "#{dms_arr[0]}#{DEGREE}#{dms_arr[1]}\'#{dms_arr[2]}\""
#   # nvm the \ just shows on the terminal but effectively it's not actually there.
# end

# p dms(30) == %(30°00'00")
# p dms(76.73) == %(76°43'48")
# p dms(254.6) == %(254°36'00") 
# # ^ evaluates to false because off by 1 due to rounding difference, prompt said is fine.
# p dms(93.034773) == %(93°02'05")
# p dms(0) == %(0°00'00")
# p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# it's actually float.divmod(1) not float.divmod(float.to_i) to split whole from decimal

# ans key:
# DEGREE = "\xC2\xB0"
# MINUTES_PER_DEGREE = 60
# SECONDS_PER_MINUTE = 60
# SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

# def dms(degrees_float)
#   total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
#   degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
#   minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
#   format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
# end

# first, they converted to total base units.


# Further Exploration
# Since degrees are normally restricted to the range 0-360, can you modify the code so it returns a value in the appropriate range when the input is less than 0 or greater than 360?

# I believe divmod naturally handles negative numbers by going in reverse of the divider... so this
# outta be easy, just set float equal to remainder of divmod(360), wait, just use mod, don't need the dividend

DEGREES_PER_CIRCLE = 360
MIN_PER_DEGREE = 60
SEC_PER_MIN = 60
DEGREE = "\xC2\xB0"

def dms(float)
  float = float % DEGREES_PER_CIRCLE
  dms_arr = []
  unit_factor_arr = [1, MIN_PER_DEGREE, SEC_PER_MIN]
  
  unit_factor_arr.each do |unit_factor|
    float = float * unit_factor
    whole, float = float.divmod(1)
    dms_arr << whole
  end
  
  dms_arr.last.round(2)
  
  dms_arr[1] = sprintf('%02d', dms_arr[1])
  dms_arr[2] = sprintf('%02d', dms_arr[2])
  # "#{dms_arr[0]}#{DEGREE}#{dms_arr[1]}\'#{dms_arr[2]}\""
  # ^ \" doesn't escape..
  "#{dms_arr[0]}#{DEGREE}#{dms_arr[1]}\'#{dms_arr[2]}\""
  # nvm the \ just shows on the terminal but effectively it's not actually there.
end

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")