const Stack = require('./Stack.js');

class QueueFromStacks {
  constructor() {
    this.enqueueHolderStack = new Stack();
    this.dequeueTempStack = new Stack();
  }

  get size() {
    return this.enqueueHolderStack.size;
  }

  isEmpty() {
    return this.enqueueHolderStack.isEmpty();
  }

  peek() {
    if (this.isEmpty()) return null;

    this.loadTempStack();
    let top = this.dequeueTempStack.peek();
    this.loadHolderStack();

    return top;
  }

  enqueue(val) {
    this.enqueueHolderStack.push(val);
    return true;
  }

  dequeue() {
    if (this.isEmpty()) return null;

    this.loadTempStack();
    let dequeued = this.dequeueTempStack.pop();
    this.loadHolderStack();

    return dequeued;
  }

  loadTempStack() {
    while (!this.isEmpty()) {
      this.dequeueTempStack.push(this.enqueueHolderStack.pop());
    }
  }

  loadHolderStack() {
    while (!this.dequeueTempStack.isEmpty()) {
      this.enqueueHolderStack.push(this.dequeueTempStack.pop());
    }
  }
}

let q = new QueueFromStacks();
console.log(q.size);
q.enqueue(4);
console.log(q.size);
q.enqueue(5);
q.enqueue(6);
q.enqueue(7);
console.log(q.size);
console.log(q.dequeue());
console.log(q.size);

module.exports = QueueFromStacks;

