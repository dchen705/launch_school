# Finished in 1:07
so for this question, I avoided writing out the pseudocode becuz it was difficult to organize my thoughtst
I just wrote out in code all the easy to complete test Cases
then i handled each difficult issue chunk like the wrapping of hours and minutes
and wrote a short piece of pseudocode for that specific section
so I really just did this assignment by passing test case by test case incrementally
instead of writing out the whole solution
not sure how I feel about this
it felt easier for me

Ok, so looking at ans key, I see that I really missed the psuedocode outline of instance methods high level
so RB139 feels like RB119 easy small problems multipled by factor of 2-6
I wonder if I can build process to mimic that bit-by-bit construction from incrementally passing each test
case
and instead incremntally write and expand this outline of high lvl algos for each question

Problem

Problem Domain
- how are we representing time?
  hh:mm:ss
    - decimals?
    60 secs - 1 min
    60 min - 1 hr
    0 hr to 12 -> modulus 12

Code Design
  Clock class
    methods:
    - add/subtract minutes to a new Clock using current Clock obj as reference
    - equality test between 2 different Clock object

Test Cases / Examples

- Clock#at returns a custom class with #+ #- methods
  - first arg specifies hour
  - 2nd arg specifies minutes
#+ and #- methods arg represents minutes
- time wrapping at midnight
  - when subtracting below 0
  - when adding over 24
  - example test case 3061 % 1440 ->
  181 % 60, 3 hour and 1 minute


Clock class
  class method:
    - #at(arg1, arg2 = 0)
      returns an instantiation of Clock

  instance methods:
    constructor
      - initialized with a hour and minutes
        - normalize to 24 and 60
          # set to attributes for hour and minutes

    +(minutes)
      normalize by days and hours, add the additional hours and minutes
      wrap the hours
      return new Clock object
    -
    normalize by days and hours, add the additional hours and minutes
      wrap the hours
      return new Clock object
    ==
      comparing hours and minutes are equal
    to_s
      returns hours and minutes in string format

DS
integers
    - represent minutes and hours of Clock object
    - represent the added and subtracted minutes argument
all calculations in integers

Algo

- given `total_min` to be added
- normalize by 1440 (mins in a day) `total_min`
- `additional_hour`, `new_min` assign to (total min + min) mod 60
- `new_hour` = ( hour + additional_hour ) mod 24
- hour + new_hour

# --- Attempt 2

time addition/subtraction logic bundle:

total min % (24 * 60) - normalize to 0 to 1440 minutes
remaining min % 60 - call divmod to acquire hour and min
h % 24 - wrap around midnight

loop until between 0 and (24 * 60 # 1440)
+ or - 1440

save as @hour and @minute or just all in @minutes

construct clock -> add/subtract time -> display in correct format

^ time add/subtract logic bundle can be placed in any of the three
i argue to put them in constructor method - so we can save minute and hours instead of just minutes (future methods)
also better to validate min and hour logic right upon clock creation

class Clock
  MIN_PER_DAY = 24 * 60 # 1440

  attr_reader :hour, :minute

  def initialize(hour, minute)
    total_min = (hour * 60 + minute) % MIN_PER_DAY
    total_hour, @minute = total_min.divmod(60)
    @hour = total_hour % 24
  end

  def +(mins)
    Clock.new(hour, minute + mins)
  end

  def -(mins)
    Clock.new(hour, minute - mins)
  end

  def to_s
    "#{format("%02d", hour)}:#{format("%02d", minute)}"
  end
end