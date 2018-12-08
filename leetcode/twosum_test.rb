require 'minitest/autorun'
require_relative 'twosum'

class TwoSumTest < MiniTest::Test
  def test_handles_given_example
    assert_equal([0, 1], two_sum([2,7,11,15], 9))
  end

  def test_handles_sum_zero
    assert_equal([1,2], two_sum([1,0,0,2,4,0], 0))
  end

  def test_handles_negative_sum
    assert_equal([4,5], two_sum([1,2,3,4,-5,-3,0], -8))
  end
end
