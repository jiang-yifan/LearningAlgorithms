def merge_sort array
  return [] if array.empty?
  return array if array.size == 1
  middle = array.size/2
  merge_helper(
    merge_sort(array.take(middle)),
    merge_sort(array.drop(middle))
    )
end

def merge_helper arr1, arr2
  result = []
  until arr1.empty? || arr2.empty?
    if arr1.first < arr2.first
      result << arr1.shift
    else
      result << arr2.shift
    end
  end
  result += arr1 + arr2
end
