# Find the smallest number in a given array of integers.

# in: array of integers
# out: lowest value integer in input
# examples: see tests
# ds: current_min int variable
# algo:
# set current_min to infinity
# iterate over list; 
# reset current_min to element value if value < current_min

import random

def find_min(integers):
    if len(integers) == 0:
        return integers

    current_min = float('inf')
    for val in integers:
        if val < current_min:
            current_min = val

    return current_min

class TestMinValue:
    def test_find_neg_10(self):
      ints = list(range(-10, 1000))
      random.shuffle(ints)
      assert find_min(ints) == -10

    def test_find_ten_thousand(self):
        ints = list(range(10000, 1000000))
        random.shuffle(ints)
        assert find_min(ints) == 10000

    def test_find_zero(self):
        ints = list(range(0, 1000000))
        random.shuffle(ints)
        assert find_min(ints) == 0

    def test_returns_empty(self):
        ints = []
        assert find_min(ints) == []

    def test_find_min_is_first(self):
        assert find_min([0,1,2,3,4,5]) == 0

    def test_find_min_is_last(self):
        assert find_min([0,1,2,3,4,5,-100]) == -100
