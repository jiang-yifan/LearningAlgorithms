require 'byebug'
class MinHeap
  attr_reader :heap
  def initialize
    @heap = []
  end

  def insert num
    heap << num
    if heap.length != 1
      real_idx = heap.length - 1
      idx = real_idx + 1
      parent_idx = idx/2 - 1
      until num >= heap[parent_idx] || real_idx == 0
        self.heap[parent_idx], self.heap[real_idx] = self.heap[real_idx], self.heap[parent_idx]
        real_idx = parent_idx
        idx = parent_idx + 1
        parent_idx = idx/2 - 1
      end
    end
    num
  end

  def count
    heap.length
  end

  def min
    heap[0]
  end

  def extract_min
    heap[0], heap[heap.length - 1] = heap[heap.length - 1], heap[0]
    result = heap.pop
    i = 0
    length = (heap.length - 1)/2
    while i <= length
      parent_idx = i
      child_idx = parent_idx * 2 + 1
      if heap[child_idx + 1]
        min_child_idx = heap[child_idx] < heap[child_idx + 1] ? child_idx : child_idx + 1
      elsif !heap[child_idx]
        break
      else
        min_child_idx = child_idx
      end
      if heap[parent_idx] > heap[min_child_idx]
        heap[parent_idx] , heap[min_child_idx] = heap[min_child_idx], heap[parent_idx]
        i = min_child_idx
      else
        break
      end
    end

    return result
  end
end

class MaxHeap
  attr_reader :heap
  def initialize
    @heap = []
  end

  def insert num
    heap << num
    if heap.length != 1
      real_idx = heap.length - 1
      idx = real_idx + 1
      parent_idx = idx/2 - 1
      until num <= heap[parent_idx] || real_idx == 0
        self.heap[parent_idx], self.heap[real_idx] = self.heap[real_idx], self.heap[parent_idx]
        real_idx = parent_idx
        idx = parent_idx + 1
        parent_idx = idx/2 - 1
      end
    end
    num
  end

  def count
    heap.length
  end

  def max
    heap[0]
  end

  def extract_max
    heap[0], heap[heap.length - 1] = heap[heap.length - 1], heap[0]
    result = heap.pop
    i = 0
    length = (heap.length - 1)/2
    while i <= length
      parent_idx = i
      child_idx = parent_idx * 2 + 1
      if heap[child_idx + 1]
        max_child_idx = heap[child_idx] > heap[child_idx + 1] ? child_idx : child_idx + 1
      elsif !heap[child_idx]
        break
      else
        max_child_idx = child_idx
      end
      if heap[parent_idx] < heap[max_child_idx]
        heap[parent_idx] , heap[max_child_idx] = heap[max_child_idx], heap[parent_idx]
        i = max_child_idx
      else
        break
      end
    end

    return result
  end
end
