require_relative "heap.rb"

def add_to_heap num, lower_half, upper_half
  if lower_half.count > upper_half.count
    if num < lower_half.max
      upper_half.insert lower_half.extract_max
      lower_half.insert num
    else
      upper_half.insert num
    end
  else
    if upper_half.min && num > upper_half.min
      lower_half.insert upper_half.extract_min
      upper_half.insert num
    else
      lower_half.insert num
    end
  end
  lower_half.max
end

upper_half = MinHeap.new
lower_half = MaxHeap.new
count = 0
num_array = []
File.open("Median.txt").each_line do |line|
  num_array << line.chomp.to_i
end
result = []
num_array.each do |num|
  result << add_to_heap(num, lower_half, upper_half)
end

p result.inject(:+) % 10000
