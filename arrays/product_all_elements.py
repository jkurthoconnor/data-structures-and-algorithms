# Given an array of numbers, return an array where each index stores the product of all numbers in the array _except_ the number at the index itself.

# in: array of numbers (integers, floats, negatives);

# out: array where each idx holds the product of all elements of the input _except_ the value at the same index in the input

# examples: see test cases

# ds: list to hold result

# algo:  
#   mapping problem, i.e. each element of the list is to be transformed
#   easy case: the value for a given place is the product of all elements divided by the current element;
#    BUT: the presense of any zero in list will result in a 0 product for the list, but that does not necessarily represent the expected value for a place if it is 0
#   the presence of more than one zero in the list will ensure that each value will be transformed to 0.
# 
# the mapping algorithm:
# - if the input list has > 1 zero, the value for each idx idx is 0
# - if the input has 1 zero, and the current element is 0, return the value of 'zero-free-product', else return 0
# else return 'zero-free-product' / element

# examples: see test cases

# idiomatic approach: uses generators and list comprehensions
# Time: O(3N) => O(N) | Space: O(N + 2) => O(N)
import math

def product_all(nums):
    if not nums:
        return []
    if len(nums) == 1:
        return [0]

    zero_free_product = math.prod(n for n in nums if n != 0)
    zero_count = nums.count(0)


    return [ transform(x, zero_free_product, zero_count) for x in nums ]

def transform(n, zeroless_prod, num_zeros):
    if num_zeros > 1:
        return 0
    elif n == 0:
        return zeroless_prod
    elif num_zeros == 1:
        return 0
    else:
        return zeroless_prod / n


class TestProductAll:
    def test_list_with_one_1(self):
        assert product_all([1,2,3,4]) == [24,12,8,6]

    def test_list_with_one_and_zero(self):
        assert product_all([4,2,1,5,0]) == [0,0,0,0,40]

    def test_list_with_zero(self):
        assert product_all([0, 12, 100]) == [1200, 0, 0]

    def test_list_with_two_zeros(self):
        assert product_all([0, 12, 100, 0]) ==[0, 0, 0, 0]

    def test_list_with_negatives(self):
        assert product_all([-1, -2, 10]) == [-20, -10, 2]

    def test_list_with_floats(self):
        assert product_all([1.5, 2, 2]) == [4, 3, 3]

    def test_empty_list(self):
        assert product_all([]) == []

    def test_single_value(self):
        assert product_all([2]) == [0]
#
