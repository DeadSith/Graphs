require_relative '../graph'

class Graph
	attr_reader :way
	
	def dijkstra(source)
		size              = @graph.length
		visited_vertices  = Array.new(size, false)
		@way              = Array.new(size, -1)
		distances         = Array.new(size, Float::INFINITY)
		distances[source] = 0
		(size-1).times do
			min                   = get_shortest_path(distances, visited_vertices)
			visited_vertices[min] = true
			size.times do |j|
				if visited_vertices[j] == false && @graph[min][j] &&
						@graph[min][j]+distances[min] < distances[j]
					distances[j] = distances[min] + @graph[min][j]
					@way[j]      = min
				end
			end
		end
		distances
	end
	
	private
	def get_shortest_path(row, visited_vertices)
		min   = Float::INFINITY
		index = -1
		self.size.times do |i|
			if visited_vertices[i] == false && row[i]<=min
				min   = row[i]
				index = i
			end
		end
		index
	end
end