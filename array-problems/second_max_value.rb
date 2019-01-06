# Implement a function which returns the second largest element in an array of integers.

# PEDAC
#   in: array of integers
#   out: integer, the second largest in input
#       clarify: 'second largest' requires at least two distinct values;
#                 duplicate values count only 1x
#   examples:
#     see tests below

#   data structure:
#     hash / (or JS Map) holding current values for largest and second largest

#   algorithm:
#     guard clause: return nil if input size < 2
#     init hash, largest: '-Infinity', second_largest: '-Inifinity'

#     iterate over array:
#       if current value <= second_largest
#         next
#       if current value > largest
#         second_largest = largest
#         largest = current value
#       if current value > second_largest && current value < greatest 
#         second_largest = current value

#         return hsh[:second_largest] if it is greater than -infinity, else return nil

require 'minitest/autorun'

class TestSecondMax < MiniTest::Test
  def test_finds_target_at_last_idx
    assert_equal(6, find_second_max([9,2,3,6]))
  end

  def test_finds_target_at_first_idx
    assert_equal(4, find_second_max([4,3,1,5,0]))
  end

  def test_finds_target_in_middle
    assert_equal(9, find_second_max([4,3,1,9,5,10]))
  end

  def test_does_not_confuse_duplicates_with_different_value_rank
    assert_equal(9, find_second_max([4,3,1,9,5,10,10]))
  end

  def test_returns_nil_for_target_not_found
    assert_nil(find_second_max([8,8,8,8]))
  end

  def test_returns_nil_for_target_not_found_empty_input
    assert_nil(find_second_max([]))
  end

  def test_returns_nil_for_target_not_found_single_value_input
    assert_nil(find_second_max([22]))
  end
end


require 'bigdecimal'

def find_second_max(array)
  return nil if array.size < 2

  values = {
    greatest: array[0],
    second_greatest: BigDecimal.new("-Infinity")
  }

  array.each do |val|
    if (val <= values[:second_greatest]) || val.eql?(values[:greatest])
      next
    end

    if val > values[:greatest]
      values[:second_greatest] = values[:greatest]
      values[:greatest] = val
    else
      values[:second_greatest] = val
    end
  end

  if values[:second_greatest].infinite?
    values[:second_greatest] = nil
  end

  values[:second_greatest]
end
