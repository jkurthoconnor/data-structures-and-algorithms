Node = Struct.new(:val, :next)

# TIME: O(N) SPACE:  
# LeetCode: faster than 100%; less memory than 51%
def remove_value(head, value)
  return nil if head.nil?

  dummy_head = Node.new(nil, head)
  prev = dummy_head
  current = head

  while current
    if current.val == value
      prev.next = current.next
    else
      prev = current
    end

    current = current.next
  end

  dummy_head.next
end


a = Node.new('a')
a2 = Node.new('a')
b = Node.new('b')
c = Node.new('c')
b2 = Node.new('b')
e = Node.new('e')
f = Node.new('f')


a.next = a2
a2.next = b
b.next = c
c.next = b2
b2.next = e
e.next = f

list = a
single_list = f

# p remove_elements(list, 'q')  # returns original list when target is not member
# p remove_elements(list, 'f')  # removes target at tail
#
p remove_elements(list, 'a')  # removes target from head (and elsewhere)
# p remove_elements(single_list, 'f') # return nil when last item is removed
