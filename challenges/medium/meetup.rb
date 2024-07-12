# require 'date'

# class Meetup
#   WEEKDAY = %w(sunday monday tuesday wednesday thursday friday saturday)
#   NTH_TO_INDEX = ['first', 'second', 'third', 'fourth', 'fifth']

#   def initialize(year, month)
#     @year = year
#     @month = month
#   end

#   def day(weekday, nth_of_month)
#     weekday.downcase!
#     nth_of_month.downcase!
#     weekday_dates = get_dates_list(weekday)
#     if nth_month == 'teenth'
#       return weekday_dates.find { |date| (13..19).include?(date.day) }
#     end

#     dates_index = nth_of_month == 'last' ? -1 : NTH_TO_INDEX.index(nth_of_month)
#     weekday_dates[dates_index]
#   end

#   private

#   attr_reader :year, :month

#   def get_dates_list(weekday)
#     weekday_dates = []
#     date_increment = Date.civil(year, month, 1)
#     while date_increment.month == month
#       weekday_dates << date_increment if WEEKDAY[date_increment.wday] == weekday
#       date_increment = date_increment.next_day
#     end
#     weekday_dates
#   end
# end

# # Refactoring
# # we don't need to iterate day by day
#   # instead we can start at the first weekday and then increment by 7
#     # to find the first - get the abs diff of the first of the month's weekday number and the given nth's(ordinal) index
#     # prob not that much optimization: going from 30ish to 4 loops? maybe that adds up.

#   # `get_first_date(weekday)`
#   #   first_of_month = Date.civil(year, month, 1)

#   #   1 + (NTH_TO_INDEX - first_of_month.wday).abs

# require 'date'
# require 'pry'

# class Meetup
#   WEEKDAYS = %w(sunday monday tuesday wednesday thursday friday saturday)
#   ORDINALS = ['first', 'second', 'third', 'fourth', 'fifth']

#   def initialize(year, month)
#     @year = year
#     @month = month
#   end

#   def day(weekday, nth_of_month)
#     weekday.downcase!
#     nth_of_month.downcase!
#     weekday_dates = get_dates_list(first_date(weekday))
#     if nth_of_month == 'teenth'
#       return weekday_dates.find { |date| (13..19).include?(date.day) }
#     end

#     dates_index = nth_of_month == 'last' ? -1 : ORDINALS.index(nth_of_month)
#     weekday_dates[dates_index]
#   end

#   private

#   attr_reader :year, :month
#   def first_date(weekday)
#     first_of_month = Date.civil(year, month, 1)
#     first_weekday = 1 + (WEEKDAYS.index(weekday) - first_of_month.wday) % 7
#     # my first take was wrong: so my math logic was bad
#     # didn't do enough testing on my algo initially
#     # first_weekday = 1 + (WEEKDAYS.index(weekday) - first_of_month.wday).abs <- this doesn''t work, doesn''t cycle.
#     # binding.pry
#     Date.civil(year, month, first_weekday)
#   end

#   def get_dates_list(date)
#     weekday_dates = []
#     loop do
#       weekday_dates << date
#       begin
#       date = Date.civil(year, month, date.day + 7)
#       rescue => e
#         break
#       end
#     end
#     weekday_dates
#   end
# end

# meetup = Meetup.new(2014, 8)
# p meetup.day('Wednesday', 'third').wday

# # refactor:
# - option 1: use the monday?, tuesday? methods to check weekdays?

# 3 main constructs
# - determining if date is desired weekday
# - determining if date is correct ordinal
#   1st to 5th
#   last
#   teenth
# - iteration through a month to obtain correct date(s)
# # Ans key
# # Date class knowledge
# You can determine the last day of the month by using the Date class by
# passing a day argument of -1 to the Date.civil method to create a Date object
# that represents the last day of the indicated year and month.

# their approach:
# Convert the weekday and schedule descriptor to lowercase.
# Calculate the first possible day of the month for the meetup.
# Calculate the last possible day of the month for the meetup.
# Search the range of possible days for the date that occurs on the desired day of the week
# Return a date object for the first matching day or a value that indicates that a meetup date couldn't be found.

# ^ how do they search a range of dates?
#   im guessing they use a Date specific method, #upto?

#   start_date = Date.civil(2020, 1, 1)
# end_date = Date.civil(2020, 1, 7)


# start_date.upto(end_date) {|date| p date}
# ^ works
# so select from that range of dates

# given ordinal, return start and end days to check (can use Civil(..-1) to obtain last date of month)
# hash string -> [int, int]
# ie 'first' -> [1, 7]

# select within date range from start to end day, date that matches

# ^ actually pretty nice as its consistent in logic with teenth. if i was more comfortable
# inferring logic and more confident with Date, that could work.

require 'date'

class Meetup
  WEEKDAYS = %w(sunday monday tuesday wednesday thursday friday saturday)
  START_END_DAYS = {
    'first' => [1, 7],
    'second' => [8, 14],
    'third' => [15, 21],
    'fourth' => [22, 28],
    'fifth' => [29, -1], # not all months end at 29 though, risk of error
    'last' => [-7, -1], # negative indexing works, nice
    'teenth' => [13, 19]
  }
      # ^ # i would not have been confident enough
      # to deduce above logic during performance time
      # another thing I realize, is prepare the outline of pseudocode first
      # once i deep dived into one particular method, I expanded out and loss
      # sense of what to do next
  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, ordinal) # returns date obj
    weekday.downcase!
    ordinal.downcase!

    start_day, end_day = START_END_DAYS[ordinal]
    start_date = Date.civil(year, month, start_day)
    end_date = Date.civil(year, month, end_day)

    start_date.upto(end_date).find do |date|
      date.wday == WEEKDAYS.index(weekday)
    end
  end
end

# fixed variable shadowing problem by doing self.nth_of_month instead of nth_of_month (local var reference)
require 'date'


class Meetup
WEEKDAY = %w(sunday monday tuesday wednesday thursday friday saturday)
NTH_TO_INDEX = ['first', 'second', 'third', 'fourth', 'fifth']


def initialize(year, month)
@year = year
@month = month
end


def day(weekday, nth_of_month)
@weekday = weekday.downcase
@nth_of_month = nth_of_month.downcase


weekday_dates = get_dates_list
if nth_of_month == 'teenth'
return weekday_dates.find { |date| (13..19).include?(date.day) }
end

dates_index = self.nth_of_month == 'last' ? -1 : NTH_TO_INDEX.index(self.nth_of_month)
weekday_dates[dates_index]
end


private


attr_reader :year, :month, :weekday, :nth_of_month


def get_dates_list
  #binding.pry
weekday_dates = []
date_increment = Date.civil(year, month, 1)
while date_increment.month == month
weekday_dates << date_increment if WEEKDAY[date_increment.wday] == weekday
date_increment = date_increment.next_day
end
weekday_dates
end
end
