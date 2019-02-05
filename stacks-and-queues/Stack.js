class Stack {
  constructor() {
    this.stack = new Array();
  }

  get size() {
    return this.stack.length;
  }

  isEmpty() {
    return this.size === 0;
  }

  push(ele) {
    this.stack.push(ele);
  }

  pop() {
    if (this.isEmpty()) {
      return null;
    } else {
      return this.stack.pop();
    }
  }

  peek() {
    if (this.isEmpty()) {
      return null;
    } else {
      return this.stack[this.size - 1];
    }
  }
}

module.exports = Stack;
