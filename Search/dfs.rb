require_relative '../graph'

class Graph
	def dfs(from, to)
		runnable
		visited       = Array.new(@graph.length, false)
		stack         = Array.new
		size          = @graph.length
		visited[from] = true
		stack.push(from)
		flag = true
		while (!stack.empty?) && flag
			size.times do |i|
				if @graph[stack.last][i] && visited[i]==false
					stack.push(i)
					visited[i] = true
					flag       = false if i == to
				end
			end
			stack.pop if flag
		end
		return nil if flag
		stack
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

graph = Graph.new(gr)
p graph.dfs(0, 6)