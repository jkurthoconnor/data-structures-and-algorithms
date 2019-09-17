# LeetCode 82. Remove Duplicates from Sorted List II
# PROBLEM:
# Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.



require_relative 'list_maker'

# TIME: O(N) SPACE: O(1)
# LeetCode: faster than 62%; less memory than 100%
def delete_duplicates(head)
  return nil if head.nil?
  return head if head.next.nil?

  dummy = ListNode.new(nil)
  dummy.next = head
  current = head
  prev = dummy
  del_value = nil

  while current
    if (current.next) && current.val == current.next.val
      del_value = current.val

      while (current) && current.val == del_value
        current = current.next
      end
      prev.next = current
    else
      prev = current
      current && current = current.next
    end
  end

  dummy.next
end


=begin
# LeetCode: faster than 100%; less memory than 100%
def remove_duplicates(head)
  return nil if head.nil?
  return head if head.next.nil?

  dumb_head = Node.new(nil)
  dumb_head.next = head
  last_uniq = dumb_head
  current = head
  editing = false
  
  while current
    if current.next && (current.val == current.next.val)
      editing = true
    else
      if editing
        last_uniq.next = current.next
        editing = false
      else
        last_uniq = current
      end
    end

    current = current.next
  end

  dumb_head.next 
end



# finally, can be done without an editing memo; just allow prev to be static until it can join to next uniq node:
#

def remove_duplicates(head)
  dummy = Node.new(nil, head)
  prev = dummy
  current = head
  nxt = current.next

  while nxt
    if current.val == nxt.val
      while nxt && (current.val == nxt.val)
        nxt = nxt.next
      end
      current = nxt
      prev.next = current
      nxt && (nxt = nxt.next)
    else
      prev = current
      current = nxt
      nxt = nxt.next
    end
  end

  dummy.next
end
=end

l1 = make_list([1,2,3,3,4,4,5])
l2 = make_list([1,1,1,2,3])
l3 = make_list([1,1])
l4 = make_list([1,2,2])
l5 = make_list([1,1,2])

p remove_duplicates(l1)  # [1,2,5]
p remove_duplicates(l2)  # [2,3]
p remove_duplicates(l3)  # []
p remove_duplicates(l4)  # [1] 
p remove_duplicates(l5)  # [2]
