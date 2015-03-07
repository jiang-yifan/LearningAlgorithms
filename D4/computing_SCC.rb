class Vertex
  attr_reader :edges
  attr_accessor :added, :seen
  attr_accessor :t
  def initialize
    @edges = []
    @added = false
  end
end

class Edge
  attr_reader :seen, :vertices
  def initialize vertex1, vertex2
    @vertices = []
    @vertices << vertex1
    @vertices << vertex2
  end
end

def DFS vertex
  return 0 if vertex.seen
  vertex.seen = true
  count = 1
  vertex.edges.each do |edge|
    count += DFS edge.vertices[1]
  end
  count
end

def DFS_rev vertex
  return if vertex.seen
  vertex.seen = true
  vertex.edges.each do |edge|
    DFS_rev edge.vertices[0]
  end
  vertex.t = $t
  $t += 1
end

vertex_arr = []
rev_arr = []
edge_arr = []
File.open("SCC.txt").each_line do |line|
  values = line.chomp.split(" ").map{|el| el.to_i}
  values.each do |value|
    if !vertex_arr[value]
      vertex = Vertex.new
      vertex_arr[value] = vertex
      rev_arr[value] = vertex
    end
  end
end

File.open("SCC.txt").each_line do |line|
  values = line.chomp.split(" ").map{|el| el.to_i}
  edge = Edge.new(vertex_arr[values[0]] , vertex_arr[values[1]])
  edge_arr << edge
  vertex_arr[values[0]].edges << edge
  rev_arr[values[1]].edges << edge
end
vertex_arr.delete_at(0)
rev_arr.delete_at(0)

$t = 1
rev_arr.each do |v|
  $stack = [v] unless v.added
  until $stack.empty?
    vertex = $stack.last
    vertex.added = true
    new_vertices = 0
    vertex.edges.each do |edge|
      v = edge.vertices[0]
      unless v.added
        new_vertices += 1
        $stack << v
        v.added = true
      end
    end
    if new_vertices == 0
      vertex.t = $t
      $t += 1
      $stack.pop
    end
  end
end

i = 0
while(i < rev_arr.length)
  vertex_arr[i].t = rev_arr[i].t
  i += 1
end

vertex_arr.sort!{|a,b| -(a.t <=> b.t)}
vertex_arr.each do |vertex|
  vertex.seen = false
  vertex.added = false
end
$counts = []

vertex_arr.each do |v|
  $stack = [v]
  $count = 0
  until $stack.empty?
    vertex = $stack.pop
    next if vertex.seen
    vertex.seen = true
    vertex.edges.each do |edge|
      vertex = edge.vertices[1]
      $stack << vertex
    end
    $count += 1
  end
  $counts << $count
end
p $counts.sort_by{|p| -p}[0...5]

# better way for small stacks
# vertex_arr.each do |vertex|
#   DFS_rev vertex
# end
#
# vertex_arr.sort_by!{|p| p.t}
# vertex_arr.reverse!
#
# counts = []
# vertex_arr.each do |vertex|
#   counts << DFS(vertex)
# end
