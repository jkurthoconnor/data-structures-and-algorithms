Node = Struct.new(:val, :next)

# LeetCode: faster than 100%; less memory than 100%
def delete_duplicates(head)
  return nil if head.nil?
  return head if head.next.nil?

  current = head
  nxt = current.next

  while nxt
    if current.val == nxt.val
      current.next = nxt.next
      nxt = nxt.next
    else
      current = current.next
      nxt = nxt.next
    end
  end

  head
end



a = Node.new(1)
a1 = Node.new(1)
b = Node.new(2)

r = Node.new(1)
r1 = Node.new(1)
s = Node.new(2)
t = Node.new(3)
t2 = Node.new(3)

d = Node.new(4)
e = Node.new(5)
f = Node.new(6)


a.next = a1
a1.next = b

r.next = r1
r1.next = s
s.next = t
t.next = t2

list1 = a
list2 = r

p delete_duplicates(list1)
# p delete_duplicates(list2)
