# queue based on array; elements must shift forward after dequeue,
# so dequeue time is O(N), as opposed to O(1) in linked-list implementation

class Queue
  def initialize
    @queue = Array.new
  end

  def enqueue(ele)
    @queue << ele
  end

  def dequeue
    @queue.shift
  end

  def size
    @queue.size
  end

  def peek
    @queue.first
  end
end

=begin
q = Queue.new
q.enqueue("hello world")
p q.size
p q.peek
q.enqueue("next string")
p q.size
p q.dequeue
p q.dequeue
p q.size
=end
