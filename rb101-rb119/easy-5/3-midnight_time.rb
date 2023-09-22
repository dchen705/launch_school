# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

# after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0

# Problem Understanding:
# Of note:
# before() + after() = 1440

# 00:00 and 24:00 as arg return 0 for both methods

# conversions:
# 60 min in 1 hour
# 24 hour in 1 day
# 1440 min in 1 day

# Algorithm:
# for `after_midnight()`
#   split `str` delimited by ":" into 2 element string array
#   convert both elements from str to int
#   assign first element to var `hours`
#   assign second element to var `minutes`
#   combine and return `total minutes` as `hours` x MIN/HR + `minutes
# for `before_midnight()`
#   1440 - aftermidnight()
#   except if 0 or 1440
  
MIN_PER_HOUR = 60
MIN_PER_DAY = 1440

def after_midnight(time)
  hours_and_minutes = time.split(":")
  hours = hours_and_minutes.first.to_i
  minutes = hours_and_minutes.last.to_i
  total_minutes = hours * MIN_PER_HOUR + minutes
  time == "00:00" || time == "24:00" ? 0 : total_minutes
end

def before_midnight(time)
  after_time = after_midnight(time)
  after_time == 0 ? 0 : 1440 - after_time
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# Further exploration:
# How would these methods change if you were allowed to use the Date and Time classes?

# other students:
# def after_midnight(time)
#   hours, mins = time.split(":").map(&:to_i)
#   (Time.new(0, 1, 1, hours, mins) - Time.new(0)) / 60 % 1440
# end

# def before_midnight(time)
#   hours, mins = time.split(":").map(&:to_i)
#   (Time.new(0) - Time.new(0, 1, 1, hours, mins)) / 60 % 1440
# end

# Another:
# further exploration with Time class

# require 'time'

# MIDNIGHT = Time.parse("00:00")
# SECONDS_IN_MINUTE = 60
# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

# def after_midnight(string_time)
#   ((Time.parse(string_time) - MIDNIGHT) / SECONDS_IN_MINUTE) % MINUTES_PER_DAY
# end

# def before_midnight(string_time)
#   (MINUTES_PER_DAY - after_midnight(string_time)) % MINUTES_PER_DAY
# end