=begin
LeetCode 61. Rotate List

Given a linked list, rotate the list to the right by k places, where k is non-negative.

Example 1:

Input: 1->2->3->4->5->NULL, k = 2
Output: 4->5->1->2->3->NULL
Explanation:
rotate 1 steps to the right: 5->1->2->3->4->NULL
rotate 2 steps to the right: 4->5->1->2->3->NULL

Example 2:

Input: 0->1->2->NULL, k = 4
Output: 2->0->1->NULL
Explanation:
rotate 1 steps to the right: 2->0->1->NULL
rotate 2 steps to the right: 1->2->0->NULL
rotate 3 steps to the right: 0->1->2->NULL
rotate 4 steps to the right: 2->0->1->NULL


IN: list, int: n of spaces to rotate list
OUT: list head; input list rotated desired places

RULES:

  overrotation: when k > list length, only need to rotate the list k % length;
  since k % length will return the correct rotation even when k <= length, set
  rotate value to k % length

  
  send runner to end of list; track list length & use `stop_rotation` reference to end of list
  as `next` to reattach to head

  send `start_rotation` forward length - rotate (track previous)
    set previous.next to nil
    `stop_rotation.next` = head
    `head = start_rotation`
=end

#LeetCode: faster than 95%; less memory than 100%
# TIME: O(N) SPACE: O(1)

require_relative "./list_maker"
ListNode = Node

def rotate_right(head, k)
  return head if (head.nil? || head.next.nil? || k.zero?)

  length = 1
  tail = head

  while tail.next
    tail = tail.next
    length += 1
  end

  rotate = k % length
  return head if rotate.zero?

  idx = 1
  rotate_point = head
  prev = nil

  while idx <= length - rotate
    prev = rotate_point
    rotate_point = rotate_point.next
    idx += 1
  end

  prev.next = nil
  tail.next = head
  rotate_point
end

list1 = make_list([1,2,3,4,5])
list2 = make_list([0,1,2])
list3 = make_list([0,1,2])
list4 = make_list([1,2])

p rotate_right(list1, 2)
p rotate_right(list2, 4)
p rotate_right(list3, 2)
p rotate_right(list4, 2)


