require_relative '../graph'

class Graph
	def primMST
		raise ArgumentError, 'Only undirected graph supported' if @directed
		size       = @graph.size
		parent    = Array.new(size)
		key        = Array.new(size, Float::INFINITY)
		visited    = Array.new(size, false)
		key[0]     = 0
		parent[0] = -1
		(size - 1).times do
			u          = min_key(key, visited)
			visited[u] = true
			size.times do |v|
				if graph[u][v] && !visited[v] &&
						graph[u][v] < key[v]
					parent[v] = u
					key[v]    = graph[u][v]
				end
			end
		end
		parent
	end
	
	def min_key(keys, visited)
		min       = Float::INFINITY
		min_index = -1
		keys.length.times do |i|
			if visited[i] == false && keys[i]<min
				min       = keys[i]
				min_index = i
			end
		end
		min_index
	end
	
	def printMST(mst_result)
		puts('Edge    Weigth')
		(1..mst_result.length-1).each do |i|
			puts "#{mst_result[i]} - #{i}    #{@graph[i][mst_result[i]]}"
		end
		self
	end
end

edge = {}
5.times do |i|
	edge[i] = {}
end
edge[0][1] = 2; edge[0][3] = 6
edge[1][2] = 3; edge[1][3] = 8; edge[1][4] = 5
edge[2][4] = 7
edge[3][4] = 9

gr = Graph.new(edge)
gr.printMST(gr.primMST)