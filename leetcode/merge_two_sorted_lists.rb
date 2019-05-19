# LeetCode 21. Merge Two Sorted Lists
#
# PROBLEM:
# Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

# IN: two sorte linked lists
# OUT: new list formed by merging the input lists
#     merged list must be sorted / ordered low to high
#
#
# MODEL:
#   list traversal with selection of lowest current value

require_relative 'list_maker'

# TIME: O(l1 + l2); SPACE: O(l1 + l2)
# LeetCode: faster than 99%; less memory than 98%
def merge_two_lists(list1, list2)
  dumb_head = Node.new(nil)
  l1_current = list1
  l2_current = list2
  merged = dumb_head

  while l1_current && l2_current
    if l1_current.val <= l2_current.val
      merged.next = l1_current
      l1_current = l1_current.next
    else
      merged.next = l2_current
      l2_current = l2_current.next
    end

    merged = merged.next
  end


  if l1_current
    merged.next = l1_current
  elsif l2_current
    merged.next = l2_current
  end

  dumb_head.next
end

l1 = make_list([1,2,4])
l2 = make_list([1,3,4])
l3 = make_list([1,2,3,4])
l4 = make_list([5,6,7,8])


p merge_two_lists(l1, l2)
p merge_two_lists(l3, l4)
#


