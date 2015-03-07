class Array
    # Insert item x in list and keep it sorted assuming self is sorted.
    #
    # If x is already in insert it to the right of the rightmost x.
    #
    # Optional args lo (default 0) and hi (default len(self)) bound the
  # slice of self to be searched.
  def insort_right(x, lo=0, hi=self.size)
    index = bisect_right(x, lo, hi)
    self.insert(index, x)
  end

  def bisect_right(x, lo=0, hi=self.size)
    raise ArgumentError, "lo must be non-negative" if lo < 0

    while lo < hi
      mid = (lo + hi) / 2
      if x < self[mid]
        hi = mid
      else
        lo = mid + 1
      end
    end

    lo
  end

  def insort_left(x, lo=0, hi=self.size)
    index = bisect_left(x, lo, hi)
    self.insert(index, x)
  end

  def bisect_left(x, lo=0, hi=self.size)
    raise ArgumentError, "lo must be non-negative" if lo < 0

    while lo < hi
      mid = (lo + hi) / 2
      if self[mid] < x
        lo = mid + 1
      else
        hi = mid
      end
    end

    lo
  end
end
