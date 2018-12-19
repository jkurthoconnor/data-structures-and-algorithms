require 'minitest/autorun'
require_relative 'reverse_signed_int'

class ReverseIntTest < MiniTest::Test
  def test_returns_0_when_output_exceeds_stipulated_range
    assert_equal(0, reverse(-8463847413))
    assert_equal(0, reverse(8463847412))
  end

  def test_handles_unsigned_positive_input
    assert_equal(321, reverse(123))
  end

  def test_handles_negative_input
    assert_equal(-321, reverse(-123))
  end

  def test_handles_signed_positive_input
    assert_equal(+123, reverse(+321))
  end

  def test_handles_signed_zero
    assert_equal(+0, reverse(+0))
    assert_equal(-0, reverse(-0))
  end

  def test_drop_leading_zero
    assert_equal(21, reverse(120))
  end
end
