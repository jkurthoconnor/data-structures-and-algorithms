=begin

LeetCode 328. Odd Even Linked List

Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.Example 1

:Input: 1->2->3->4->5->NULL
Output: 1->3->5->2->4->NULL

Example 2:Input: 2->1->3->5->6->4->7->NULL
Output: 2->3->6->7->1->5->4->NULL

Note:The relative order inside both the even and odd groups should remain as it was in the input.
The first node is considered odd, the second node even and so on ...
Message Input#


IN: list
OUT: same list(mutated) with odd indices at start, and even at end

1  3  5 2 4  

*  *   *   *
2  3   6   7  1 5  4
#
****  iterate list; at each even idx, attach node to tail  **** 

          send runner to find end/tail
            mark tail
         # track number of moves / end idx 

          # set idx = 1
          iterate list
            if idx.odd?
              tail.next = nxt
              curr.next = nxt.next
              curr = curr.next
              nxt = nxt.next

              tail.next.next = null


              # idx += 2
=end


# LeetCode: faster than 100%; less memory than 100%
# TIME: O(N); SPACE: O(1)

require_relative "./list_maker"

def move_evens(head)
  return head if (head.nil? || head.next.nil?)

  current = head
  tail = nil
  size = 1 

  while current.next
    current = current.next
    size += 1
  end

  return head if size < 3

  tail = current
  current = head

  size = size / 2

  while size > 0
    nxt = current.next
    current.next = nxt.next
    current = current.next

    tail.next = nxt
    tail = tail.next
    tail.next = nil

    size -= 1
  end

  head
end
 

list1 = make_list([1,2,3,4,5])
list2 = make_list([2,1,3,5,6,4,7])

p move_evens(list1)
p move_evens(list2)
