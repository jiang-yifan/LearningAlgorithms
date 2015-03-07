Vertex = function(){
  this.edges = [];
  this.seen = false;
}
Vertex.prototype.toggle_seen = function () {
  this.seen ? false : true;
};

Edge = function(vertex1, vertex2){
  this.vertices = [vertex1,vertex2];
}

function dfs(vertex) {
  if vertex.seen{
    return 0;
  }
  vertex.toggle_seen;
  var count = 1;
  vertex.edges.forEach(function(edge){
    count += dfs(edge.vertices[1])
  });
  return count;
}


function dfs_rev(vertex){
  if vertex.seen{
    return;
  }
  vertex.toggle_seen
  vertex.edges.forEach(function(edge){
    dfs_rev(edge.vertices[0])
  });
  vertex.t = t;
  t += 1;
}

var vertex_arr = []
var edge_arr = []
File.open("SCC.txt").each_line do |line|
  values = line.chomp.split(" ").map{|el| el.to_i}
  values.each do |value|
    if !vertex_arr[value]
      vertex = Vertex.new
      vertex_arr[value] = vertex
    end
  end
end

File.open("SCC.txt").each_line do |line|
  values = line.chomp.split(" ").map{|el| el.to_i}
  edge = Edge.new(vertex_arr[values[0]] , vertex_arr[values[1]])
  edge_arr << edge
  vertex_arr[values[0]].edges << edge
  vertex_arr[values[1]].edges << edge
end
vertex_arr.delete_at(0)
$t = 1

vertex_arr.each do |vertex|
  DFS_rev vertex
end

vertex_arr.sort_by!{|p| p.t}
vertex_arr.reverse!

vertex_arr.each do |vertex|
  vertex.toggle_seen
end
counts = []
vertex_arr.each do |vertex|
  counts << DFS(vertex)
end
p counts.sort_by{|p| -p}[0...5]
