require_relative '../edge_graph'

class Graph
	def find(parent, i)
		if parent[i] == i
			return i
		end
		find(parent, parent[i])
	end
	
	def union(parent, rank, x, y)
		x_root = find(parent, x)
		y_root = find(parent, y)
		if rank[x_root] < rank[y_root]
			parent[x_root] = y_root
		elsif rank[y_root] < rank[x_root]
			parent[y_root] = x_root
		else
			parent[y_root] = x_root
			rank[x_root]   += 1
		end
		nil
	end
	
	def kruskalMST
		result = []
		i      = 0
		e      = 0
		@graph.sort_by! { |edge| edge[2] }
		parent = []
		rank   = []
		@size.times do |k|
			parent << k
			rank << 0
		end
		while e < @size - 1
			u, v, w = graph[i]
			i       +=1
			x       = find(parent, u)
			y       = find(parent, v)
			unless x == y
				e += 1
				result << [u, v, w]
				union(parent, rank, x, y)
			end
		end
		result
	end
	
	def printMST(mst_result)
		puts('Edge    Weigth')
		mst_result.each do |u,v,w|
			puts("#{u} - #{v}   #{w}")
		end
	end
end

g = Graph.new(4)
g.add_edge(0, 1, 10)
g.add_edge(0, 2, 6)
g.add_edge(0, 3, 5)
g.add_edge(1, 3, 15)
g.add_edge(2, 3, 4)
g.printMST(g.kruskalMST)