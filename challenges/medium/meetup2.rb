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

# here's how they prevented getting invalid Date creation error
# last_possible_day = [first_possible_day + 6, @days_in_month].min

# any further refactoring?
# maybe using blocks/procs?