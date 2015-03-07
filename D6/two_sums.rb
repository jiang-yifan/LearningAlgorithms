require 'set'
require_relative 'vendor/bisect'
def two_sums array, set
  seen = Set.new
  array.sort!
  array.each do |first|
    left = -10000 - first
    right = 10000 - first
    left_index = array.bisect_left(left)
    right_index = array.bisect_right(right)
    subarray = array[left_index...right_index]
    subarray.each do |second|
      sum = second + first
      seen.add(sum)
    end
  end
  seen.size
end
set = Set.new
array = []
File.open("algo1-programming_prob-2sum.txt").each_line do |line|
  num = line.chomp.to_i
  set.add(num)
  array << num
end
p array.length
p two_sums array, set
