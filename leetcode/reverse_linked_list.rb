Node = Struct.new(:val, :next)

# LeetCode: faster than 97%; less memory than 100%
=begin
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
=end

# LeetCode: faster than 90%; less memory than 100%

def reverse_list(head)
  return nil if head.nil?
  return head if head.next.nil?

  previous = nil
  current = head
  nxt = current.next

  while current
    current.next = previous
    previous = current
    current = nxt
    nxt && (nxt = nxt.next)
  end

  previous
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
