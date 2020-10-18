# Implement a function which returns the second largest element in an array of integers.

# in: list of integers
# out: second largest value of list member

# ds: dict with 'largest' and 'second_largest' keys

# algo:
#     guard: return empty list for empty input
#     initialize max dict, each key defaults to -inf
#     iterate through input:
#         if value > largest, set second = largest, largest = value
#        else if value > second, second = value
#       if second > -inf return second, else return None

# Time: O(N) | Space: O(1)
def second_max(ints):
    if not ints:
        return []

    ranks = { 'max': float('-inf'), 'second': float('-inf') }

    for i in ints:
        if i > ranks['max']:
            ranks['second'] = ranks['max']
            ranks['max'] = i
        elif ranks['second'] < i != ranks['max']:
            ranks['second'] = i

    if ranks['second'] > float('-inf'):
        return ranks['second']
    else:
        return None

import random

class TestSecondMax:
    def test_empty_input(self):
        assert second_max([]) == []

    def test_target_at_end(self):
        values = [ i for i in range(-10,100000) if not i == 99998 ]
        random.shuffle(values)
        values.insert(-1, 99998)
        assert second_max(values) == 99998

    def test_target_at_start(self):
        values = [ i for i in range(-10,100000) if not i == 99998 ]
        random.shuffle(values)
        values.insert(0, 99998)
        assert second_max(values) == 99998

    def test_target_in_random_idx1(self):
        values = [ i for i in range(-10,100000) ]
        random.shuffle(values)
        assert second_max(values) == 99998

    def test_target_in_random_idx2(self):
        values = [ i for i in range(-10,100000) ]
        random.shuffle(values)
        assert second_max(values) == 99998

    def test_duplicate_max(self):
        values = [ i for i in range(-10,100000) ]
        values.append(99999)
        random.shuffle(values)
        assert second_max(values) == 99998

    def test_all_one_value1(self):
        assert second_max([1,1,1,1,1]) == None

    def test_all_one_value2(self):
        assert second_max([1]) == None
