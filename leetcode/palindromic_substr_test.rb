require 'minitest/autorun'
require_relative 'palindromic_substr'

class PalindromeTest < MiniTest::Test
  def test_accepts_single_char_palindromes
    assert_equal(3, count_substrings("abc"))
  end

  def test_accepts_duplicate_chars_at_diff_indexes
    assert_equal(6, count_substrings("aaa"))
  end

  def test_case_sensitive_searching
    assert_equal(4, count_substrings("aAa"))
  end

  def test_case_sensitive_searching
    assert_equal(4, count_substrings("aAa"))
  end

  def test_empty_string
    assert_equal(0, count_substrings(""))
  end

  def test_one_char_string
    assert_equal(1, count_substrings("a"))
  end

  def test_whitespace_counts
    assert_equal(4, count_substrings("\n\t\n"))
  end
end
