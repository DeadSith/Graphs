require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'

require_relative '../floyd_warshall'
require_relative 'solver'

MiniTest::Reporters.use!

class DijkstraTest < Minitest::Test
  NUMBER_OF_ITERATIONS = 1000
  SIZE = 15
  def test_algo
    NUMBER_OF_ITERATIONS.times do
      array = Array.new(SIZE){ |i|
        Array.new(SIZE){ |j|
          if i == j
            0
            else
            if Random.rand(5)==0
              Float::INFINITY
            else
              Random.rand(101)
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