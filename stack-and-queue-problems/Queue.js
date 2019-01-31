class Queue {
  constructor() {
    this.queue = new Array();
  }

  enqueue(ele) {
    this.queue.push(ele);
  }

  dequeue() {
    return this.queue.shift();
  }

  peek() {
    return this.queue[0];
  }
}

module.exports = Queue;
