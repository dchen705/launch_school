# 1:56 hh:mm to finish
# damn, I feel the debugging cost like 30 minutes minimum
# for this one, I actually felt good about my approach and thinking, but yeah th

# note knowing how to extract "Monday" form a date object

# got stuck debugging , for reason unknown, empty array returned when input is
# I discovered something very subtle
i created an instance var getter, i call a method and reassign that instance var
then before htat method concludes, I call a helper method, within that helper
i reference the instance var using either getter or just @ notation expecting
the updated return value insteead I get nil
^ so conclusion: instance var assignment doesn''t seem to occur until the
method that the reassignement clause is within finishes executing...


'Monday' rather than 'monday' doesn't look like casing issue '
given:
- integer `month`(1-12)
- integer `year` (ie:2021)
- string `nth_day` ('first' or 'second')
- string 'day'('Monday')

return
- date represented by the 3 given values

rules/requirements
  inputs
  - 'nth' day is case insensitive
  -  ^`day` too

  domain knowledge/trivia
  - '5th' day is not guaranteed in all months or for all days
  -  guaranteed that each day of the week (Monday, Tuesday, ...)
  will have exactly one date that is the "teenth" of that day in every month.

  Language specific
  - Date.civil(year, month, day) # only unknown is the day
DS
`determine_teenth` - regex probably makes easier, so use strings

flagging system
  - case or if statements
    if first then ... if second then...
  - first, second..., last to represent a sequential list (array)

`Monday` -> list of all mondays in given month
[Date1, Date2, Date3]
      ^ these are all Mondays in given month of given year

Algo
  Outline
    `Meetup` class
      `constructor` - given 2 ints, `year` `month`

      `day` - given 2 strings, `day`, `nth_day`
        - make case insenitive the inputs (downcase or upcase)
        - day_number = HELPER1
        - returns Date object

        HELPER1
        - given `day` and `nth day`, year and month
        [first case: `first monday
          - get list of all mondays
          - get nth monday from list as Date object
        `]
          return a date

  Procedural Flow
      -> get time-ordered list of all dates of given day
      -> use `nth_day` index to return the desired date

  Low lvl Algo for difficult part
  `get list of all mondays` -
      set `all_mondays` to []
      iterate from 1st day of month until last day of month
        - concat date to `all_mondays` if date is monday
        - call #send passing in arg returned by HELPER2 on `all_mondays`
          - returns the correct Date object

    HELPER2
    `get_array method as symbol or integer from input string`
        - `hash_index` obj which we define (ie: {'first'=>:first, 'second' => 1}) to convert
          `nth day` to symbol such as :first or 0

    Realize I forgot logic for teenth
      - I think:
        can search through weekdates list and use find regex pattern
          list of mondays.find(/teen/).first
          oops nvm
          it''s 13-19


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
    @nth_of_month = nth_of_month

    weekday_dates = get_dates_list
    if nth_month == 'teenth'
      return weekday_dates.find { |date| (13..19).include?(date.day) }
    end

    dates_index = nth_of_month == 'last' ? -1 : NTH_TO_INDEX.index(nth_of_month)
    weekday_dates[dates_index]
  end

  private

  attr_reader :year, :month, :weekday, nth_of_month

  def get_dates_list
    weekday_dates = []
    date_increment = Date.civil(year, month, 1)
    while date_increment.month == month
      weekday_dates << date_increment if WEEKDAY[date_increment.wday] == weekday
      date_increment = date_increment.next_day
    end
    weekday_dates
  end
end