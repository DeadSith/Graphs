class Graph
	attr_reader :graph, :directed, :run
	
	def initialize(vertices = 0, graph = {}, directed = false)
		@size     = vertices
		@directed = directed
		@graph    = []
		graph.each do |edge|
			@graph << edge
		end
	end
	
	def add_edge (i, j, value)
		@size = i+1 if i>=@size
		@size = j+1 if j>=@size
		@graph << [i, j, value]
	end
	
	def remove_edge(i, j)
		raise Exception, 'Not implemented'
	end
	
	def runnable
		raise ArgumentError, 'Graph was changed after creation, create new one' if @run
	end
end