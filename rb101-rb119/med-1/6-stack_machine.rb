# 24:30
# watching - it took me about 6:30 to just digest everything but it was fine.
# another thing was my initial vision wasn't what it ended up - which is fine.
# my initial ideas may change.

# Lang fluency correction:
# case statements which I tried to use as if statements
  # `when input.to_i_to_s == input` -> not valid
  # weirdly if no `else` in `case` defaults to the only/last branch?

# register
# ---stack


# ---

# Problem

#   iteration through the input string - transforming each word into the corresponding call

#   data structures:
#     register - variable
#     stack - array


# Example

# Data Structure

# Algorithm

#   - Read the series of commands, command at a Time
#   - helper - call_method
#     given - command
#     - execute the appropriate program
#   -


def minilang(commands)
  register = 0
  stack = []

  commands.split do |command|
    if command.to_i.to_s == command
      register = command.to_i
    else
      case command
      when 'PRINT'
        puts register
      when 'PUSH'
        stack.push(register)
      when "ADD"
        register += stack.pop
      when "SUB"
        register -= stack.pop
      when "MULT"
        register *= stack.pop
      when "DIV"
        register /= stack.pop
      when "MOD"
        register %= stack.pop
      when "POP"
        register = stack.pop
      end
    end
    
  end

end

# minilang('PRINT')
# minilang('5 PUSH 3 MULT PRINT')
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# minilang('5 PUSH POP PRINT')
# # 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)