class Graph
	attr_reader :graph, :directed
	
	def initialize(graph = {},directed = false)
		size = graph.size
		@graph = {}
		@directed = directed
		size.times do |i|
			@graph[i] = {}
		end
		size.times do |i|
			size.times do |j|
				if graph[i][j]
					@graph[i][j] = graph[i][j]
					@graph[j][i] = graph[i][j] unless directed
				end
			end
		end
	end
	
	def add_edge (i, j, value)
		@graph[i][j] = value
		@graph[j][i] = value unless directed
		self
	end
	
	def remove_edge(i,j, graph = @graph)
		graph[i].delete(j)
		graph[j].delete(i) unless directed
		self
	end
	
	def size
		@graph.length
	end
	
	def [] (key)
		@graph[key]
	end
end