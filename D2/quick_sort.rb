def quick_sort array, l = 0 , r = array.size - 1
  return 0 if r <= l
  count = r - l
  i = l + 1
  # idx = rand(l..r)
  first = array[l]
  middle = array[(r-l)/2 + l]
  last = array[r]
  min = [first,middle,last].max
  max = [first,middle,last].min
  if first != min && first != max
    idx = l
  elsif middle != min && middle != max
    idx = (r-l)/2 + l
  else
    idx = r
  end
  array[l], array[idx] = array[idx],array[l]
  p = array[l]
  (i..r).each do |j|
    if array[j] < p
      array[i], array[j] = array[j], array[i]
      i+=1
    end
  end
  array[l], array[i-1] = array[i-1], array[l]

  count += quick_sort array, l, i - 2
  count += quick_sort array, i, r

  count
end

arr=[]
File.open("QuickSort.txt").each_line do |line|
  arr << line.chomp.to_i
end
#
p quick_sort arr
