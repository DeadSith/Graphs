class Solver
	def self.solve(graph, source)
		@size = graph.length
		@visited_vertices = Array.new(@size, false)
		distances = Array.new(@size, 1000)
		distances[source] = 0
		(@size-1).times do
			min = get_shortest_path(distances)
			@visited_vertices[min] = true
			@size.times do |j|
				if @visited_vertices[j] == false && distances[min] != 1000 &&
						graph[min][j]+distances[min] < distances[j]
					distances[j] = distances[min] + graph[min][j]
				end
			end
		end
		distances
	end
	
	private
	attr_accessor :visited_vertices, :size
	def self.get_shortest_path(row)
		min = Float::INFINITY
		index = -1
		@size.times do |i|
			if @visited_vertices[i] == false && row[i]<=min
				min = row[i]
				index = i
			end
		end
		index
	end
end