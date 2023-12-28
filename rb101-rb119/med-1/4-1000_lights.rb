# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

# Given - integer, n that represents number of switches

# Return - an array representing the switches that are on.

# High Abstract Components
#   - Iteration over counter - 1 to n
#   - Toggling of on and off
#     - find multiples of counter from 1 to n to toggle
#     - what data structure to 'save' the state of toggle
#   - return a selection of switches in which only elements that have the 'on' state 

#   Mid level approaches
#     - selecting 'on' switches - we have to select and then transform the original 

# Data Structures
#   Range
#   array 

# 1..n -> select all elements with 'on state'

# 1..n -> [1, 2, 3, 4, ...]
# -> {1 => [true], 2 => [false]}


# on_ switches


# Algorithm
#   - intialize a hash object, 'on_switches'
#   - iterate from range, (Creation of on switches)
#     `1..n`,set current `num`
#     assigning to `on_swithces`, key of `num` to value of [false]
#   - iterate over (1..n), set round as current Iteration (Toggle)
#     -  select a subset of `on_switches` that have keys that are a multiple of `round` and assign to 'toggle_this_round'
#     - for each, `toggle_this_round`
#       flip true to false or false to true depending if includes true or false

#     - select from `on_switches` if value is [true] then select, assign to `currently_on` and return the values of that hash object

#   Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

def lights_on(n)
  range = (1..n)
  on_switches = {}
  range.each do |light|
    on_switches[light] = [false]
  end
  range.each do |round|
    toggle_this_round = on_switches.select do |light, _|
      light % round == 0
    end
    toggle_this_round.each do |light, on_state|
      if on_state.include?(false)
        on_state[0] = true
      else
        on_state[0] = false
      end
    end
  end
  on_switches.select do |light, on_state|
   on_state == [true] 
  end.keys
end

p lights_on(10)

# revisited
# 1000 lights
# relationship
#   - the number of factors of light n with (1..n) - and whether that number is odd or even determines if light is on or off respectively

def lights(n)
  (1..n).select do |light|
    ((1..light).count do |potential_factor|
      light % potential_factor == 0
    end).odd?
  end
end

similar other student''s
def toggle_lights(n)
  (1..n).select do |num|
    toggle = false

    1.upto(num) { |count| toggle = !toggle if num % count == 0 }
    toggle
  end
end

def lights(n)
  result = []
  (1..n).each do |switch_num|
    switch_state = false
    (1..n).each do |pass_num|
      switch_state = !switch_state if switch_num % pass_num == 0
    end
    result << switch_num if switch_state
  end
  result
end