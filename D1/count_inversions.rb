def count_inversion array
  return [[],0] if array.empty?
  return [array, 0] if array.size == 1

  middle = array.length / 2
  sorted_left, left = count_inversion array.take(middle)
  sorted_right, right = count_inversion array.drop(middle)
  sorted_all, split = count_split_inv sorted_left, sorted_right
  return [sorted_all, left + right + split]
end

def count_split_inv arr1, arr2
  result = []
  count = 0
  until arr1.empty? || arr2.empty?
    if arr1.first < arr2.first
      result << arr1.shift
    else
      count += arr1.length
      result << arr2.shift
    end
  end
  result += arr1 + arr2
  [result, count]
end


arr=[]
File.open("IntegerArray.txt").each_line do |line|
  arr << line.chomp.to_i
end

p count_inversion arr
