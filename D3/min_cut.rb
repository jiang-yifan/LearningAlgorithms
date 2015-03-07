require 'byebug'
def min_cut_helper v, e
  count = 0
  v.each do |vertex|
    if !vertex
      count +=1
    end
  end
  return e.length if v.size - count == 2
  rand_edge = rand(e.length)
  # p "v: #{v}"
  # p "e: #{e}"
  # p "rand #{rand_edge}"
  a,m = e[rand_edge]
  e.delete_at(rand_edge)
  i = 0
  while i < e.length
    edge = e[i]
    if edge[0] == edge[1]
      e.delete_at(i)
      i -= 1
    end
    if edge[0] == m
      edge[0] = a
    end
    if edge[1] == m
      edge[1] = a
    end
    if edge[0] == edge[1]
      e.delete_at(i)
      i-=1
    end
    i+=1
  end

  v[a].concat(v[m]).uniq!
  v[m] = false
  min_cut_helper v, e
end

def min_cut v_arr,e_arr
  min_cuts = nil
  num = 0
  1000.times do
  v = v_arr.map{ |el| el.map{|i| i}}
  e = e_arr.map{|el| el.map{|i| i}}
    num = min_cut_helper v,e
    if !min_cuts || num < min_cuts
      min_cuts = num
    end
  end
  min_cuts
end


vertex_arr = []
edge_arr = []
vertex = 1
edge = 0
File.open("kargerMinCut.txt").each_line do |line|
line_array = line.chomp.split(" ").map{ |el| el.to_i}
  if line_array[0] == vertex
    vertex_arr.push([])
    vertex +=1
  end
end
vertex = 1
File.open("kargerMinCut.txt").each_line do |line|
line_array = line.chomp.split(" ").map{ |el| el.to_i}
  if line_array[0] == vertex
    vertex +=1
    (1...line_array.length).each do |i|
      find_idx = edge_arr.find_index([line_array[i] - 1, vertex - 2])
      if !find_idx
        edge_arr.push([vertex - 2, line_array[i] - 1])
        vertex_arr[vertex - 2].push(edge)
        edge += 1
      else
        vertex_arr[vertex - 2].push(find_idx)
      end
    end
  end
end
p min_cut vertex_arr, edge_arr
