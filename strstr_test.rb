require 'minitest/autorun'
require_relative 'strstr'

class StrStrTest < MiniTest::Test
  def test_finds_chars_in_middle
    assert_equal(2, str_str("hello", "ll"))
  end

  def test_returns_properly_for_no_find
    assert_equal(-1, str_str("aaaaa", "bba"))
  end

  def test_finds_char_at_end
    assert_equal(8, str_str("abababaalook", "look"))
  end

  def test_finds_char_at_start
    assert_equal(0, str_str("lookhere", "look"))
  end

  def test_finds_str_when_complete_match
    assert_equal(0, str_str("hello", "hello"))
  end

  def test_case_sensitive
    assert_equal(-1, str_str("hello", "hEllo"))
  end

  def test_return_zero_when_needle_empty
    assert_equal(0, str_str("hello", ""))
  end

  def test_return_zero_when_needle_empty
    assert_equal(0, str_str("hello", ""))
  end

  def test_return_neg_one_when_empty_haystack
    assert_equal(-1, str_str("", "a"))
  end
end
