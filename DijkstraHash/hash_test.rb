require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'

require_relative '../floyd_warshall'
require_relative 'solver'

MiniTest::Reporters.use!

class DijkstraTest < Minitest::Test
  NUMBER_OF_ITERATIONS = 100
  SIZE = 15
  def test_algo
    NUMBER_OF_ITERATIONS.times do
      hash = {}
      array = Array.new(SIZE){ |i|
        hash[i] = {}
        Array.new(SIZE){ |j|
          if i == j
            hash[i][j] = 0
            0
          else
            if Random.rand(5)==0
              Float::INFINITY
            else
              r = Random.rand(101)
              hash[i][j] = r
              r
            end
          end
        }
      }
      sol = FloydWarshall.solve(array)
      SIZE.times do |i|
        assert_equal(sol[i],Solver.solve(array,i))
      end
    end
  end
end