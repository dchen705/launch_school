class Clock
  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def to_s
    format("%02d:%02d", hour, minute)
  end

  def +(total_min)
    total_min %= 1440

    added_hour, new_minute = (minute + total_min).divmod(60)
    new_hour = (hour + added_hour) % 24
    Clock.new(new_hour, new_minute)
  end

  def -(total_min)
    total_min %= 1440
    subtracted_hour, new_minute = (minute - total_min).divmod(60)
    new_hour = (hour + subtracted_hour) % 24
    Clock.new(new_hour, new_minute)
  end

  def ==(other_clock)
    hour == other_clock.hour && minute == other_clock.minute
  end

  protected

  attr_reader :hour, :minute
end

# Refactoring suggestions:
# replace magic numbers with constants (ie: 1440 -> MIN_PER_DAY)
# abstract out wrapping mechanism in + and - methods for readability

class Clock
  MIN_PER_DAY = 1440

  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def to_s
    format("%02d:%02d", hour, minute)
  end

  def +(total_min)
    Clock.new(*(wrap_times(normalize_into_one_day(total_min))))
  end

  def -(total_min)
    Clock.new(*(wrap_times(normalize_into_one_day(-total_min))))
  end

  def ==(other_clock)
    hour == other_clock.hour && minute == other_clock.minute
  end

  protected

  attr_reader :hour, :minute

  def wrap_times(delta_min)
    delta_hour, new_minute = (minute + delta_min).divmod(60)
    new_hour = (hour + delta_hour) % 24
    [new_hour, new_minute]
  end

  def normalize_into_one_day(delta_min)
    delta_min % MIN_PER_DAY
  end
end

# hmm cool one-liner but doesn''t seem more readable

class Clock
  MIN_PER_DAY = 1440
  HOUR_PER_DAY = 24

  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def to_s
    format("%02d:%02d", hour, minute)
  end

  def +(total_min)
    delta_min = normalize_into_one_day(total_min)
    delta_hour, new_minute = (minute + delta_min).divmod(60)
    new_hour = wrap_around_midnight(delta_hour)
    Clock.new(new_hour, new_minute)
  end

  def -(total_min)
    self.+(-total_min)
  end

  def ==(other_clock)
    hour == other_clock.hour && minute == other_clock.minute
  end

  protected

  attr_reader :hour, :minute

  private

  def wrap_around_midnight(delta_hour)
    (hour + delta_hour) % HOUR_PER_DAY
  end

  def normalize_into_one_day(delta_min)
    delta_min % MIN_PER_DAY
  end
end

# at one point i was wondering, should i keep min and hour as separate variables
# here's other student that kept as all in minutes and used the constructor for the + and - methods...
# class Clock
#   MINS_PER_DAY = 24 * 60

#   def self.at(hour, min = 0)
#     new(hour, min)
#   end

#   def initialize(hours, mins)
#     time = ((hours * 60) + mins) % MINS_PER_DAY
#     @hour, @min = time.divmod(60)
#   end

#   def +(mins)
#     self.class.new(hour, min + mins)
#   end

#   def -(mins)
#     self.class.new(hour, min - mins)
#   end

#   def to_s
#     format('%02d:%02d', hour, min)
#   end

#   def ==(other)
#     hour == other.hour && min == other.min
#   end

#   protected

#   attr_reader :hour, :min
# end

class Clock
  MIN_PER_DAY = 24 * 60 # 1440

  attr_reader :hour, :minute

  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    total_min = (hour * 60 + minute) % MIN_PER_DAY
    @hour, @minute = total_min.divmod(60)
    #@hour = total_hour % 24 # this line is unnessary, we alraedy normalized 0 to 1440
  end

  def +(mins)
    Clock.new(hour, minute + mins)
  end

  def -(mins)
    Clock.new(hour, minute - mins)
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  def ==(other_clock)
    hour == other_clock.hour && minute == other_clock.minute
  end
end

# key step is taking the total minutes and normalizing between 0 to 1440, this will remove need to wrap.
# other key step is divmodding into hour and minutes