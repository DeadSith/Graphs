class Graph
	attr_reader :graph, :directed
	
	def initialize(graph = {},directed = false)
		@size = graph.size
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
		@graph[i] = {} unless @graph[i]
		@graph[j] = {} unless @graph[j]
		@size = i+1 if i+1 > @size
		@size = j+1 if j+1 > @size
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
		@size
	end
	
	def [] (key)
		@graph[key]
	end
end