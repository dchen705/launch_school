# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

def running_total(arr)
if !arr.empty?
  running_total = [arr[0]]

  arr.reduce do |total, n|
    total += n
    running_total << total
    total
  end
else
  running_total = []
end

running_total
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# Further exploration:
def running_total2(arr)
  arr.each_with_object([]) do |n, obj|
    if obj.empty?
    obj << n
    else
    obj << n + obj[-1]
    end
  end
end