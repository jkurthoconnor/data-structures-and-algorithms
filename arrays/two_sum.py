# Given an list and a number, `n`, find two numbers from the list that sum to `n`. If two numbers are found, return them as a two-member list. If no two numbers that meet the criteria are found, return 'false'.


#   in: list of numbers, `n`
#   out: if successful, an list of 2 numbers from input that sum to `n`;
#        if not successful, `False`

#   eg. see tests
# algo:

# naive: Time O(N^2)
# nested loops, with inner loop beginning at one idx beyond outer idx;
# return values at each when the two equal target sum, or false


# Time O(N^2) | Space: O(1)
# def find_sum(ints, target):
#     for outer_idx, val in enumerate(ints):
#         inner_idx = outer_idx + 1
#         while inner_idx < len(ints):
#             if val + ints[inner_idx] == target:
#                 return [ val, ints[inner_idx] ]
#             inner_idx += 1

#         if outer_idx == len(ints) - 2:
#             break
#     return False

# Time O(N) | Space O(N)
# algo: iterate 1x through the items, adding each new value to a 'seen' dict;
# at each iteration, check if target - current_val is in 'seen', if so, return that value and current value
# if the loop exits naturally, return False

# more language agnostic:
# def find_sum(ints, target):
#     seen = {}
#     idx = 0
#     while idx < len(ints):
#         complement = target - ints[idx]
#         if seen.get(complement):
#             return [complement, ints[idx]]
#         else:
#             seen[ints[idx]] = True
#             idx += 1
#     else:
#         return False

# more idiomatic:
def find_sum(ints, target):
    seen = {}
    for val in ints:
        complement = target - val
        if seen.get(complement):
            return [complement, val]
        else:
            seen[val] = True

    return False


class TestFindSum:
    def test_normal(self):
        assert find_sum([1,21,3,14,5,60,7,6], 81) == [21, 60]

    def test_target_is_element(self):
        assert find_sum([3,1,2,4], 3) == [1,2]

    def test_last_elements(self):
        assert find_sum([20, 22, 19, 1], 20) == [19, 1]

    def test_seek_zero(self):
        assert find_sum([100, -20, 20, 10], 0) == [-20, 20]

    def test_first_elements(self):
        assert find_sum([20,30,9,10,50], 50) == [20, 30]

    def test_complement_pair(self):
        assert find_sum([1,2,3,2,3,9], 6) == [3, 3]

    def test_one_element(self):
        assert find_sum([1], 12) == False

    def test_empty(self):
        assert find_sum([], 12) == False
