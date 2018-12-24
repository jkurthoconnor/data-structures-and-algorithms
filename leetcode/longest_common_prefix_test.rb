# 14. [Longest Common Prefix](https://leetcode.com/problems/longest-common-prefix/)
#

require 'minitest/autorun'
require_relative 'longest_common_prefix'

class PrefixTest < MiniTest::Test
  def test_empty_input_array
    assert_equal("", longest_common_prefix([]))
  end

  def test_no_common_prefix
    assert_equal("", longest_common_prefix(%w{ dog racecar car }))
  end

  def test_short_common_prefix
    assert_equal("fl", longest_common_prefix(%w{ flower flow flight }))
  end

  def test_prefix_is_whole_word
    assert_equal("flowershop", longest_common_prefix(%w{ flowershop flowershop flowershop }))
  end

  def test_checks_first_and_last_elements
    assert_equal("", longest_common_prefix(%w{ flower flow flight dog }))
    assert_equal("", longest_common_prefix(%w{ dog flower flow flight }))
  end
end
