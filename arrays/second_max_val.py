# Implement a function which returns the second largest element in an array of integers.

# in: array of int
# out: second largest value int

# examples: see tests

# algo: 
# create max dict with two keys, first and second; set each to -inf
# iterate over list:
    # if current val is > first set it to first and set second to value of previous first
    # else if current val is < first > second, set second to current val

# return second or None in case second is neg inf

# Time: O(N) | Space O(1)
def second_max(ints):
    max = {
            'first': -float('inf'),
            'second': -float('inf')
            }

    for i in ints:
        if i > max['first']:
            max['second'] = max['first']
            max['first'] = i
        elif max['first'] > i > max['second']:
            max['second'] = i

    if max['second'] > -float('inf'):
        return max['second'] 
    else:
        return None


class TestSecondMax:
    def test_target_at_end(self):
        assert second_max([9,2,3,6]) == 6

    def test_target_at_start(self):
        assert second_max([4,3,1,5,0]) == 4

    def test_target_in_mid(self):
        assert second_max([1,2,3,6,4,1,9]) == 6

    def test_duplicate_max(self):
        assert second_max([1,2,3,3,2]) == 2

    def test_all_one_value1(self):
        assert second_max([1,1,1,1,1]) == None

    def test_all_one_value2(self):
        assert second_max([1]) == None
