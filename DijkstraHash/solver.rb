class Solver
	attr_reader :way
	
	def self.solve(graph_hash, source)
		@size             = graph_hash.length
		@visited_vertices = Array.new(@size, false)
		@way              = Array.new(@size, -1)
		distances         = Array.new(@size, Float::INFINITY)
		distances[source] = 0
		(@size-1).times do
			min                    = get_shortest_path(distances)
			@visited_vertices[min] = true
			@size.times do |j|
				if @visited_vertices[j] == false && graph_hash[min][j] &&
						graph_hash[min][j]+distances[min] < distances[j]
					distances[j] = distances[min] + graph_hash[min][j]
					@way[j]      = min
				end
			end
		end
		distances
	end
	
	private
	attr_accessor :visited_vertices, :size
	attr_writer :way
	
	def self.get_shortest_path(row)
		min   = Float::INFINITY
		index = -1
		@size.times do |i|
			if @visited_vertices[i] == false && row[i]<=min
				min   = row[i]
				index = i
			end
		end
		index
	end
end