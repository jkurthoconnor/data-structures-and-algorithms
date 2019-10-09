#! /usr/bin/env ruby


Node = Struct.new(:val, :left, :right)

def search_b_tree(root, target)
  return -1 if root.nil?
  return root if root.val == target

  if root.val < target
    search_b_tree(root.right, target)
  else
    search_b_tree(root.left, target)
  end
end

n1 = Node.new(1)
n2 = Node.new(2)
n3 = Node.new(3)
n4 = Node.new(4)
n5 = Node.new(5)
n6 = Node.new(6)
n7 = Node.new(7)

=begin
            4
       2        6
     1   3   5    7
=end

bst = n4
n4.left, n4.right = n2, n6
n2.left, n2.right = n1, n3
n6.left, n6.right = n5, n7


p search_b_tree(bst, 4)
puts
p search_b_tree(bst, 6)
puts
p search_b_tree(bst, 7)
puts
p search_b_tree(bst, 1)
puts
p search_b_tree(bst, 11)

