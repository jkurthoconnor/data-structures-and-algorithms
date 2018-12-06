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

  def peek
    @queue.first
  end
end

