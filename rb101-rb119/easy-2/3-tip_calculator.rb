# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# reflex algo
# nah don't need
# just straight code this.

print("What is the bill? ")
bill = gets.chomp.to_f
print("What is the tip percentage? ")
tip_percent = gets.chomp.to_f



tip = (bill * (tip_percent / 100))
bill = (bill + tip).round(2)

tip = tip.round(2)

puts("The tip is $#{sprintf("%#.2f", tip)}")
puts("The tip is $#{sprintf("%#.2f", bill)}")

# ok breaking the Kernel#format down:
# sprintf("%#.2f", bill)
# the f represents float
# look at the values before and after the decimal
# i think # represents add as many spaces as digits, cuz when i change
# # to 20, it gives 20 trailing to left of decimal. 
# putting 2 to right of decimal gives me two decimal spaces, i looked
# up this method returns a string.