=begin
PROBLEM:
Insert a node into a binary tree.

IN: binary tree/root, value
OUT: root for same tree, with node of given value inserted in proper spot 

RULES / CLARIFICATIONS:
  new key is always inserted at a leaf
  insertion at leaf based on BST rules: lower values to left; higher values to right
  
RECURSIVE FORMULATION:
  recursively search left or right half of current tree based on value sought / current values
  when null is found along path, insert value

BASE CASE:

  when node.nill? insert value into left/right side of parent as appropriate

=end
require_relative "../tree_traversal_patterns"

Node = Struct.new(:val, :left, :right)

def insert_into_tree(root, value, parent=nil)
  if root.nil? 
    leaf = Node.new(value)
    if parent.nil?
      root = leaf
    elsif value < parent.val
      parent.left = leaf
    else
      parent.right = leaf
    end
    return parent || root
  end

  if value < root.val
    insert_into_tree(root.left, value, root)
  else
    insert_into_tree(root.right, value, root)
  end
end


one = Node.new(1)
one2 = Node.new(1)
two = Node.new(2)
two2 = Node.new(2)
three = Node.new(3)
three2 = Node.new(3)
four = Node.new(4)
four2 = Node.new(4)
five = Node.new(5)
six = Node.new(6)
seven = Node.new(7)
nine = Node.new(9)
twenty = Node.new(20)
fifteen = Node.new(15)

four.left = two
four.right = seven
two.left = one
two.right = three
seven.left = six
seven.right = nine

=begin
        4
    2       7
 1     3  6    9
=end

tree = four

p insert_into_tree(four, 5)
# p insert_into_tree(four, 100)
# p insert_into_tree(nil,10)
traverse_breadth_first(four)
