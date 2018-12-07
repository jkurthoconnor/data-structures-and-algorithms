require 'minitest/autorun'
require_relative 'twosum_sorted'

class TwoSumTest < MiniTest::Test
  def test_handles_given_example
    assert_equal([1, 2], two_sum_sorted([2,7,11,15], 9))
  end

  def test_handles_sum_zero
    assert_equal([2,3], two_sum_sorted([-1,0,0,2,4,5], 0))
  end

  def test_handles_negative_sum
    assert_equal([2,6], two_sum_sorted([-9,-8,-5,-4,-1,0], -8))
  end
end
