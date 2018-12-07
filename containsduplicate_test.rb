require 'minitest/autorun'
require_relative 'containsduplicate'

class ContainsDuplicateTest < MiniTest::Test
  def test_finds_dupes_at_extremes
    assert(containsduplicate([1,2,3,1]))
  end

  def test_finds_dupes_at_start
    assert(containsduplicate([1,1,1,3,3,4,3,2,4,2]))
  end

  def test_no_dupes
    refute(containsduplicate([1,2,3,4]))
  end

  def test_no_dupe_in_empty_arr
    refute(containsduplicate([]))
  end
end


# Problem Statement:

#   Given an array of integers, return true if any value appears at least twice in the array, and return false if every element is distinct.

#   Example 1:
#     in: [1,2,3,1]
#     out: true

#   Example 2:
#     in: [1,2,3,4]
#     out: false

#   Example 3:
#     in: [1,1,1,3,3,4,3,2,4,2]
#     out: true
