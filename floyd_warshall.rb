class FloydWarshall
	def self.solve(graph)
		dist = Marshal.load(Marshal.dump(graph))
		n = dist.length
		n.times do |k|
			n.times do |i|
				n.times do |j|
					if #dist[i][k]!=Float::INFINITY && dist[k][j]!= Float::INFINITY &&
							dist[i][j] > dist[i][k] + dist[k][j]
						dist[i][j] = dist[i][k] + dist[k][j]
					end
				end
			end
		end
		dist
	end
end