require_relative '../graph'
class Graph
	def bfs_solve(from, to, graph = @graph)
		size          = graph.length
		visited       = Array.new(size, false)
		parent        = Array.new(size, -1)
		queue         = Array.new
		visited[from] = true
		queue.push(from)
		until queue.empty?
			current = queue.shift
			if current == to
				return parent
			end
			size.times do |i|
				if graph[current][i]>0 && !visited[i]
					visited[i] = true
					parent[i]  = current
					queue.push(i)
				end
			end
		end
		parent
	end
	
	def ford_fulkerson(from, to)
		size = @graph.length
		copy = Array.new(size)
		size.times do |i|
			copy[i] = Array.new(size)
			size.times do |j|
				if @graph[i][j]
					copy[i][j] = @graph[i][j]
				else
					copy[i][j] = 0
				end
			end
		end
		max_flow = 0
		parent   = self.bfs_solve(from, to, copy)
		until parent[to] == -1
			path_flow = Float::INFINITY
			v         = to
			until v == from
				u         = parent[v]
				path_flow = [path_flow, copy[u][v]].min
				v         = u
			end
			v = to
			until v==from
				u          = parent[v]
				copy[u][v] -=path_flow
				copy[v][u] +=path_flow
				v          = u
			end
			max_flow +=path_flow
			parent   = self.bfs_solve(from, to, copy)
		end
		max_flow
	end
end

g  = [[0, 16, 13, 0, 0, 0],
      [0, 0, 10, 12, 0, 0],
      [0, 4, 0, 0, 14, 0],
      [0, 0, 9, 0, 0, 20],
      [0, 0, 0, 7, 0, 4],
      [0, 0, 0, 0, 0, 0]]
gr = Graph.new(g, true)
p gr.ford_fulkerson(0, 5)