# Stack implemented on a linked-list

Node = Struct.new(:value, :next)

class Stack
  def initialize
    @dumb_top = Node.new
    @size = 0
  end

  def push(val)
    new_item = Node.new(val, @dumb_top.next)
    @dumb_top.next = new_item
    @size += 1
  end

  def pop
    target = @dumb_top.next

    if target
      @dumb_top.next = target.next
      @size -= 1
    end 

    target.nil? ? target : target.value
  end

  def peek
    @dumb_top.next ? @dumb_top.next.value : nil
  end

  def size
    @size
  end
end

=begin
s = Stack.new
s.push("hello")
p s.size
s.push("world")
p s.size

p s.pop
p s.size
p s.peek

p s.pop
p s.size
p s.peek

s.push("new content")
s.push("more new stuff")
p s.size
p s.peek

p s
=end
