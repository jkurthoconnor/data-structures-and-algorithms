class Stack {
  constructor() {
    this.stack = new Array();
  }

  push(ele) {
    this.stack.push(ele);
  }

  pop() {
    return this.stack.pop();
  }

  peek() {
    let lastIdx = this.stack.length - 1;
    return this.stack[lastIdx];
  }
}

module.exports = Stack;
