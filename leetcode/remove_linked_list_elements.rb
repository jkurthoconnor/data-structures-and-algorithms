Node = Struct.new(:val, :next)

# TIME: O(N) SPACE:  
# LeetCode: faster than 100%; less memory than 51%
def remove_elements(head, target)
  return nil if head.nil?

  dummy = Node.new(nil)
  prev = dummy
  cur = head
  prev.next = cur

  while cur
    if cur.val == target
      cur = cur.next
      prev.next = cur
    else
      prev = cur
      cur = cur.next
    end
  end

  dummy.next
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



=begin

# pseudo code model
def reverse(h)
  dummy = new node
  dummy.next = head
  prev = dummy
  current = head
  nxt = head.next

  while current
    curr.next = prev
    prev = curr
    curr = nxt
    nxt = nxt.next
  end

  prev
end

# pseudo code model
# dummy head is head of new list

def merge(h1, h2)
  while h1 && h2
    # traverse both lists
    # attach the lower of the current nodes to dummy.current.next
    #
  end

  # check: which list has ended?
  #         attach the other current to dummy.current.next

  dummy.next
end
=end