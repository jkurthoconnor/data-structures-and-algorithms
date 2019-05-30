=begin
LeetCode: 114. Flatten Binary Tree to Linked List

PROBLEM:

Given a binary tree, flatten it to a linked list in-place.

For example, given the following tree:

    1
   / \
  2   5
 / \   \
3   4   6

The flattened tree should look like:

1
 \
  2
   \
    3
     \
      4
       \
        5
         \
          6





CLARIFICATION:
  A _flattened tree_ is the tree with nodes in preorder arrangement, with each subsequent node being the right child of the previous node. The root remains the same; it is serving as 'head'
  
MODEL:
use a preorder traversal pattern
each node is placed in a queue

dequeue and set node as prev

loop while queue
   current = dequeue
   prev.node left = nil
   prev.node.right = current
   prev = current

=end

# LeetCode: faster than 100%; less memory than 100%
def flatten(root)
  return [] if root.nil?
  assemble_list(load_queue(root))
end

def load_queue(root, queue=[])
  return nil if root.nil?

  queue << root
  load_queue(root.left, queue)
  load_queue(root.right, queue)

  queue
end

def assemble_list(queue)
  previous = queue.shift

  while !queue.empty?
    previous.left = nil
    current = queue.shift
    previous.right = current
    previous = current
  end
end
  



Node = Struct.new(:val, :left, :right)

zero = Node.new(0)
one = Node.new(1)
two = Node.new(2)
three = Node.new(3)
four = Node.new(4)
five = Node.new(5)
six = Node.new(6)
nine = Node.new(9)

# one.left = two
# one.right = three

# t1 = one
#

four.left = nine
four.right = zero
nine.left = five
five.left = six
nine.right = one

t2 = four

flatten(t2)
p t2


