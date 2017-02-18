require_relative '../graph'

class Graph
	def bfs(from, to)
		sol = bfs_solve(from, to)
		if sol
			res     = Array.new
			current = to
			while current != -1
				res << current
				current = sol[current]
			end
			return res
		end
		nil
	end
	
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
				if graph[current][i] && !visited[i]
					visited[i] = true
					parent[i]  = current
					queue.push(i)
				end
			end
		end
		parent
	end
end

=begin
gr = {}
7.times do |i|
	gr[i] = {}
end
gr[0][1]=1; gr[0][2]=1; gr[0][3]=1
gr[1][0]=1; gr[1][2]=1; gr[1][4]=1; gr[1][5]=1
gr[2][0]=1; gr[2][1]=1; gr[2][3]=1; gr[2][4]=1
gr[3][0]=1; gr[3][2]=1
gr[4][1]=1; gr[4][2]=1; gr[4][6]=1
gr[5][1]=1; gr[5][6]=1
gr[6][4]=1; gr[6][5]=1

graph = Graph.new(gr)

p graph.bfs_solve(0, 6)
 7 5 2 1
=end