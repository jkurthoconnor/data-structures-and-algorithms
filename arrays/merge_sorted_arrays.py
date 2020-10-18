# Given two sorted arrays, merge them into a new array, also sorted.
#
# in: two sorted arrays (low to high)
# out: one, new sorted array combining inputs
#
# eg.: see tests

# algo:
# init empty 'merged' list
# set idx1 and idx2 counters
# iterate over lists in parallel: (i.e. loop while idx of both is in range)
#   if val 1 <= val2, push val 1 onto merged and increment idx1
#   else push val 2 onto merged and increment idx2
# after exiting loop, add the remaining elements in the non-empty list to the end of merged
# return merged
#   
# Time: O(N1 + N2) | Space: O(N1 + N2)
def merge(int1, int2):
    merged = []
    idx1, idx2 = 0,0

    while idx1 < len(int1) and idx2 < len(int2):
        val1, val2 = int1[idx1], int2[idx2]
        if val1 <= val2:
            merged.append(val1)
            idx1 += 1
        else:
            merged.append(val2)
            idx2 += 1

    if idx1 < len(int1):
       merged.extend(int1[idx1:])
    else:
       merged.extend(int2[idx2:])

    return merged



class TestMerge:
    def test_equal_size_inputs(self):
        assert merge([1,3,4,5], [2,6,7,8]) == [1,2,3,4,5,6,7,8]

    def test_unequal_size_inputs(self):
        assert merge([2], [1,3]) == [1,2,3]

    def test_identical_inputs(self):
        assert merge([1,1,1,1], [1,1,1,1]) == [1,1,1,1,1,1,1,1]

    def test_unequal_size_inputs(self):
        assert merge([2], [1,3]) == [1,2,3]

    def test_empty_inputs(self):
        assert merge([], []) == []

    def test_negative_values(self):
        assert merge( [-1, 0, 2, 9], [-4, 0, 2, 21]) == [-4, -1, 0, 0, 2, 2, 9, 21]

    def test_big_lists(self):
        first = [ i for i in range(-1000, 11000, 19) ]
        second = [ i for i in range(-13455555, 960, 2) ]
        assert merge(first, second) == sorted(first + second)


