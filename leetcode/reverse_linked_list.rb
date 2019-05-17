Node = Struct.new(:val, :next)

# LeetCode: faster than 97%; less memory than 100%
def reverse_list(head)
  return nil if head.nil?
  return head if head.next.nil?

  prev = nil
  cur = head
  nxt = cur.next

  while nxt
    cur.next = prev
    prev = cur
    cur = nxt
    nxt = cur.next
  end

  cur.next = prev
  cur
end

a = Node.new('a')
b = Node.new('b')
c = Node.new('c')
b2 = Node.new('b')
e = Node.new('e')
f = Node.new('f')


a.next = b
b.next = c
c.next = b2
b2.next = e
e.next = f

list = a
single_list = f

p reverse_list(list)
# p reverse_list(single_list)



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
