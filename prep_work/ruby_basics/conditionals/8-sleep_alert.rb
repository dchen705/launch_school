status = ['awake', 'tired'].sample

def sleep_alert(status)
  return "Be productive!" if status == 'awake'
  return "Got to sleep!"
end

return_value = sleep_alert(status)
puts return_value


# # Their solution:
# # alert = if status == 'awake'
# #           'Be productive!'
# #         else
# #           'Go to sleep!'
# #         end

# # puts alert

# # Didn't know you can put an if statement to the
# right of a variable assignment

# also they use the return value of the if statement
# to avoid putting puts for each conditional case.