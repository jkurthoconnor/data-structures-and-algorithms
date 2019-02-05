class Queue {
  constructor() {
    this.elements = new Array();
  }

  get size() {
    return this.elements.length;
  }

  isEmpty() {
    return this.size === 0;
  }

  enqueue(ele) {
    this.elements.push(ele);
  }

  dequeue() {
    if (this.isEmpty()) {
      return null;
    } else {
    return this.elements.shift();
    }
  }

  peek() {
    if (this.isEmpty()) {
      return null;
    } else {
    return this.elements[0];
    }
  }
}

module.exports = Queue;
