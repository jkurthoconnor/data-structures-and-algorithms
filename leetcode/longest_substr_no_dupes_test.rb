require 'minitest/autorun'
require_relative 'longest_substr_no_dupes'

class LongestSubTest < MiniTest::Test
  def test_simple_case
    assert_equal(3, longest_sub("abcabcbb"))
  end

  def test_single_char_repeated_string
    assert_equal(1, longest_sub("bbbbb"))
  end

  def test_single_char_string
    assert_equal(1, longest_sub("a"))
  end

  def test_empty_string
    assert_equal(0, longest_sub(""))
  end

  def test_all_chars_unique
    assert_equal(26, longest_sub(('a'..'z').to_a.join))
  end

  def test_whitespace_counts_as_char
    assert_equal(3, longest_sub("he  hehehehe "))
    assert_equal(5, longest_sub("as\n\t "))
  end
end
