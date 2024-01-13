~16 minutes to debug
arr = ["9", "8", "7", "10", "11"]

arr.sort! do |x, y|
  y.to_i <=> x.to_i
end

p arr
Expected output: ["11", "10", "9", "8", "7"] 
Actual output: ["10", "11", "7", "8", "9"] 

actual output is sorted by asciibetical values

I ran binding.pry and print methods within the sort block
and neither ran

this leads me to conclude that the sort method on each iteration
checks if the array is already sorted?

'9' <=> '8' #=> 1
9 <=> 8 #=> 1

even after I changed to sort_by,instead an enumerator was returned
implying that no block was given...


arr = ["9", "8", "7", "10", "11"]
arr.sort_by! do |x, y|
  y.to_i <=> x.to_i
end
# returns ["9", "8", "7", "10", "11"]

Below works, but I still don''t understand why intial solution doesn''t work:

arr = ["9", "8", "7", "10", "11"]

arr.sort_by do |x|
  x.to_i
end.reverse

This also works:

arr = ["9", "8", "7", "10", "11"]

arr.sort! do |x, y|
  y.to_i <=> x.to_i
end

p arr

why does sort! work but not sort?

Ok I understand after seeing this:
arr = ["9", "8", "7", "10", "11"]

p (arr.sort do |x, y|
  y.to_i <=> x.to_i
end)
this works too.

apparently, the arr objects binds to the print call before the sort call
so the sort return value is not printed out. rather the return value of p call is sorted then returned

ANs key:
The main reason why the output was unexpected is because when you use do...end block, p and arr.sort bind more tightly due to Ruby's precedence rules, so you are passing the block to the return value of p arr.sort. It's as though you wrote:


p arr.sort { |x, y| y.to_i <=> x.to_i }

# Other student's
The wrong explanation leading to an overlapping alternative solution
Based on the documentation for Array#sort, it was unclear to me that something other than exactly "a <=> b" or "b <=> a" could be passed in the block, so I thought the #to_i methods were casuing the block to be ignored (debugger never hit that line). Clearly, that's not the case, but here is a way around without removing code.
arr = ["9", "8", "7", "10", "11", "12", "20"]
p arr.map { |x| x.to_i }.sort do |x, y|
  y.to_i <=> x.to_i
end