class Vertex
  attr_reader :edges
  attr_accessor :t
  def initialize
    @edges = []
  end
end

class Edge
  attr_reader :vertices, :l
  def initialize vertex1, vertex2, l
    @l = l
    @vertices = [vertex1,vertex2]
  end
end

def shortest_path vertices
  shortest_path = Hash.new{}
  shortest_path[vertices[0].t] = 0
  stack = [vertices[0]]
  until stack.empty?
    vertex = stack.pop
    vertex.edges.each do |edge|
      new_vertex = edge.vertices[1]
      path_length = shortest_path[vertex.t] + edge.l
      if !shortest_path[new_vertex.t] ||
          shortest_path[new_vertex.t] > path_length
        shortest_path[new_vertex.t] = path_length
        stack << new_vertex
      end
    end
  end
  return shortest_path
end

vertex_arr = []
edge_arr = []

File.open("dijkstraData.txt").each_line do |line|
  values = line.chomp.split(" ").map{|el| el.to_i}
  if !vertex_arr[values[0]]
    vertex = Vertex.new
    vertex.t = values[0]
    vertex_arr[values[0]] = vertex
  end
end

File.open("dijkstraData.txt").each_line do |l|
  line = l.chomp.split(" ")
  start = line[0].to_i
  line[1..-1].each do |values|
    tail, length =values.split(',').map{|el| el.to_i}
    edge = Edge.new(vertex_arr[start] , vertex_arr[tail], length)
    edge_arr << edge
    vertex_arr[start].edges << edge
  end
end
vertex_arr.shift
result = shortest_path vertex_arr
p result[7]
p result[37]
p result[59]
p result[82]
p result[99]
p result[115]
p result[133]
p result[165]
p result[188]
p result[197]
