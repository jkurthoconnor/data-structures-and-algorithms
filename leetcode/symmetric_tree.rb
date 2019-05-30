=begin




tree symmetry is an issue of palindromic levels
  a level (represented with nil for absent potential siblings) is symmetric if it is 
  a palindrome

=end

# LeetCode: faster than 97%; less memory than 75%
# TIME: O(node count); SPACE: O(node count)
def is_symmetric(root)
  levels = tree_levels(root)

  levels.each do |level| 
    return false unless is_palindrome?(level)
  end

  true
end

def tree_levels(root)
  levels = []
  queue = [root]

  while !queue.empty?
    level_size = queue.size
    level = []

    level_size.times do
      current = queue.shift

      if current.class == Node
        level.push(current.val)
        (current.left && queue.push(current.left))   || queue.push(nil)
        (current.right && queue.push(current.right)) || queue.push(nil)
      else
        level.push(current)
      end
    end

    levels.push(level)
  end

  if levels.last.select { |level| level }.empty?
    levels.pop
  end

  levels
end

def is_palindrome?(arr)
  left, right = 0, arr.length - 1
  
  while left < right
    return false if arr[left] != arr[right]
    left += 1
    right -= 1
  end

  true
end

Node = Struct.new(:val, :left, :right)

one = Node.new(1)
two = Node.new(2)
two2 = Node.new(2)
three = Node.new(3)
three2 = Node.new(3)
four = Node.new(4)
four2 = Node.new(4)
five = Node.new(5)


one.left = two
one.right = two2
two.left = three
two.right = four
two2.left = four2
two2.right = three2

symtree = one

# one.left = two
# one.right = two2
# two.right = three
# two2.right = three2

# asymtree = one

# p is_symmetric(asymtree)
p is_symmetric(symtree)


