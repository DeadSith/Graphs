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
				if @visited_vertices[j] == false &&
						graph[min][j] != 0 && distances[min] != 1000 &&
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
		min = 1001
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

gr = [[0, 4, 0, 0, 0, 0, 0, 8, 0],
      [4, 0, 8, 0, 0, 0, 0, 11, 0],
      [0, 8, 0, 7, 0, 4, 0, 0, 2],
      [0, 0, 7, 0, 9, 14, 0, 0, 0],
      [0, 0, 0, 9, 0, 10, 0, 0, 0],
      [0, 0, 4, 14, 10, 0, 2, 0, 0],
      [0, 0, 0, 0, 0, 2, 0, 1, 6],
      [8, 11, 0, 0, 0, 0, 1, 0, 7],
      [0, 0, 2, 0, 0, 0, 6, 7, 0]]
p Solver.solve(gr, 0)