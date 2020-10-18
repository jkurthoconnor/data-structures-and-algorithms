# Given an array of integers, find the first unique integer in the array

# PEDAC

#    in: array of integers
#    out: first unique integer
#      - 'first': earliest occurance / lowest index (_not_ lowest value)


#  examples: see tests
# ALGOS

#######
# Time O(N^2) 
# iterate over list; count each element; return the first one to have a count of 1, or if loop exits without finding a count of one, return []


# def first_unique(ints):
#     for i in ints:
#         if ints.count(i) == 1:
#             return i
#     else:
#         return []

#######
# Time: O(N^2) | Space: O(N)
# iterate over list with nested loops:
# outer loops over entire list (with idx)
#   if element is in 'seen' continue;
#   add element to 'seen' dict, with element as key, and value as True
#       inner loop over outer idx + 1 to end
            # if element equals outer loop element value break
            # if reach end of inner loop, without encountering a match with outer loop, return element
    # if outer loop completes return []
# 
# if values of outer and inner match, add value as key to seen dict
# and break


# def first_unique(ints):
#     seen = {}

#     for idx, ele in enumerate(ints):
#         if seen.get(ele):
#             continue
#         seen[ele] = True

#         for idx2 in range(idx + 1, len(ints)):
#             if ints[idx2] == ele:
#                     break
#         else:
#             return ele
#     else:
#         return []

######
# Time: O(N+N) | Space: O(N)
# iterate through list 2x:
# first iteration prepares a dict with the key being the element and the value being the element's count
# second iteration is over the list elements, checking each in the count dict; return the first element to have a count of 1
# if second iteration ends without encountering a count of 1, return []


def first_unique(ints):
    count = {}
    for ele in ints:
        if count.get(ele):
            count[ele] += 1
        else:
            count[ele] = 1

    for ele in ints:
        if count[ele] == 1:
            return ele
    return []

class TestFirstUnique:
    def test_first_is_unique(self):
        assert first_unique([9,2,3,2,6,6]) == 9

    def test_last_is_unique(self):
        assert first_unique([4,5,5,5,4,2]) == 2

    def test_no_unique(self):
        assert first_unique([9,2,3,9,2,6,6,3]) == []

    def test_middle_unique(self):
        assert first_unique([4,5,1,2,0,4]) == 5

    def test_all_are_unique(self):
        assert first_unique([1,2,3,4,5]) == 1

    def test_first_by_idx_not_value(self):
        assert first_unique([-1, -2]) == -1
