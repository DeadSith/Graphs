module BFS
	def self.get_solution(graph, from, to)
		sol = self.solve(graph, from, to)
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
	
	private
	def self.solve(graph, from, to)
		size          = graph.length
		visited       = Array.new(size, false)
		parent        = Array.new(size, -1)
		queue         = Array.new
		visited[from] = true
		queue.push(from)
		while !queue.empty?
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
p BFS.get_solution(gr, 0, 6)
# 7 5 2 1