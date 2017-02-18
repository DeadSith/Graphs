require_relative '../graph'
class Graph
	def euler_circuit
		raise ArgumentError, 'Only undirected graph supported' if @directed
		size         = @graph.length
		copy = {}
		size.times do |i|
			copy[i] = {}
			size.times do |j|
				if @graph[i][j]
					copy[i][j] = graph[i][j]
				end
			end
		end
		odd_vertices = Array.new
		size.times do |i|
			if copy[i].length % 2 == 1
				odd_vertices.push(i)
				if odd_vertices.length > 2
					return nil
				end
			end
		end
		stack  = Array.new
		result = Array.new
		if odd_vertices.length == 2
			stack.push(odd_vertices[1])
		else
			stack.push(0)
		end
		i = stack.last
		j = 0
		until stack.empty?
			while !copy[i][j] && j<size
				j = j + 1
			end
			if j < size
				stack.push(j)
				remove_edge(i,j,copy)
			else
				result.push(stack.pop)
			end
			i = stack.last
			j = 0
		end
		result
	end
end

gr = {}
3.times do |i|
	gr[i] = {}
end
gr[0][1] = 1; gr[0][2] = 1
gr[1][2] = 1

graph = Graph.new(gr, false)
p graph.euler_circuit