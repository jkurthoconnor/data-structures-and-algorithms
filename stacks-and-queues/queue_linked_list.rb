# Linked list-based queue. Maintains expected O(1) time for all core operations
#

Node = Struct.new(:value, :next)

class Queue
  def initialize
    @dumb_front_of_line = Node.new
    @back_of_line = @dumb_front_of_line
    @size = 0
  end

  def enqueue(val)
    new_item = Node.new(val)
    @back_of_line.next = new_item
    @back_of_line = new_item
    @size += 1
  end

  def size
    @size
  end

  def dequeue
    target = @dumb_front_of_line.next

    if @size > 0
      @dumb_front_of_line.next = target.next
      @back_of_line = @dumb_front_of_line if @size == 1
      @size -= 1
    else
      target = nil
    end

    target.nil? ? target : target.value
  end
end

=begin
q = Queue.new

q.enqueue("hello")
p q.size
q.enqueue("there")
p q.size
q.enqueue("world")
p q.size
p q.dequeue
p q.size
p q.dequeue
p q.size
p q
p q.dequeue
p q.size
p q.dequeue
p q.size
p q
q.enqueue("new material")
p q
q.enqueue("next item")
p q
=end
