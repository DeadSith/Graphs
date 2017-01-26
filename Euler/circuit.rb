#Todo: write Graph class and add all methods to it

#only for undirected
class Circuit
	def self.solve(graph)
		size         = graph.length
		odd_vertices = Array.new
		size.times do |i|
			if graph[i].length % 2 == 1
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
		while !stack.empty?
			while !graph[i][j] && j<size
				j = j + 1
			end
			if j < size
				stack.push(j)
				graph[i][j] = nil
				graph[j][i] = nil
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
gr[1][0] = 1; gr[1][2] = 1
gr[2][0] = 1; gr[2][1] = 1

p Circuit.solve(gr)