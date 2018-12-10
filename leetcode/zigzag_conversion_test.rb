require 'minitest/autorun'
require_relative 'zigzag_conversion'

class ConversionTest < MiniTest::Test
  def setup
    @string = "PAYPALISHIRING"
  end

  def test_one_rail_cipher
    assert_equal(@string,  convert(@string, 1))
  end

  def test_three_rail_cipher
    assert_equal("PAHNAPLSIIGYIR",  convert(@string, 3))
  end

  def test_four_rail_cipher
    assert_equal("PINALSIGYAHRPI",  convert(@string, 4))
  end

  def test_five_rail_cipher
    assert_equal("PHASIYIRPLIGAN",  convert(@string, 5))
  end
end
