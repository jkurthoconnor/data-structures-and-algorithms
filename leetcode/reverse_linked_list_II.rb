# LeetCode 92. Reverse Linked List II
#
#Reverse a linked list from position m to n. Do it in one-pass.

#Note: 1 ≤ m ≤ n ≤ length of list.

#Example:

#Input: 1->2->3->4->5->NULL, m = 2, n = 4
#Output: 1->4->3->2->5->NULL

##

# MODEL:
#   list traversal modified to mark reattachment points
#   send segment to reverse method that returns [head, tail]
#   reattach head and tail
#   
require_relative 'list_maker'

# TIME: O(N) SPACE: O(1)
# LeetCode: faster than 100%; memory less than 100%
def reverse_between(head, start, stop)
  dumb_head = Node.new(nil)
  prev = dumb_head
  current = head
  nxt = current.next 
  node_number = 1

  while current
    if node_number == start
      slice_head_reattach = prev
      slice_head_reattach.next = nil
      slice_tail = current
      slice_tail.next = nil
    end

    if (node_number > start) && (node_number < stop)
      current.next = prev
    elsif node_number == stop
      current.next = prev
      slice_head_reattach.next = current
      slice_tail.next = nxt
    end

    prev = current
    current = nxt
    nxt = nxt.next if nxt
    node_number += 1
  end

  start == 1 ?  dumb_head.next : head
end

l1 = make_list([1,2,3,4,5,6])
l2 = make_list([1,2,3,4,5])
l3 = make_list([1,2,3,4,5])
l4 = make_list([1,2,3,4,5])

p reverse_between(l1, 2, 4)
# p reverse_between(l2, 2, 4)
# p reverse_between(l3, 2, 5)
# p reverse_between(l3, 1, 2)

