# stack abstract data type implemented with an array
# LIFO

class Stack
  def initialize
    @stack = Array.new
  end

  def push(ele)
    @stack.push(ele)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end

  def size
    @stack.size
  end
end

