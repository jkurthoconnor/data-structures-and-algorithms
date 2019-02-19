// Problem Statement:
//  Implement a minStack class which will have a min() function. The min() 
//  function will return the minimum value in the stack in O(1) time
//    NB: the minimum value is returned; no element is removed from the stack
//
// Approach A: (fails to return min in O(1) Time
//  use a Stack as the main DS;
//  use a Stack as a temp holder for identifying the min
//  implement `pop` and `push` as wrappers
//  calculate min on the fly by popping into a new stack while tracking min;
//    reset stack state by popping back into it
//
//
//  Approach B:
//    - like A, but optimize by caching last minimum;
//    - updating it on the fly if a push inserts lower value
//      or if a pop removes current min;
//      - e.g. each event calls a 'set min' function
//
//  Approach C:
//      algorithm using a main stack and a 'running min'
//      stack that holds the minimum value at each point
//      e.g. the running min stack will hold the minimum values corresponding
//      to the main stack at any given size
//      
//      init both main and runningMin stacks
//
//      push: 
//        push val onto main stack
//
//        if val <= minVal stack peek, push val to min stack
//        else push minVal peek to minVal
//      pop:
//        pop top from both stacks
//      minimum:
//        return minVal peek

const Stack = require ('./Stack.js');


//
//
// Approach B
class MinStackB {
  constructor() {
    this.stack = new Stack();
    this.temp = new Stack();
    this._min = Infinity;
  }

  get minimum() {
    return this._min;
  }

  resetMinimum() {
    this._min = this.stack.peek();

    while (!this.stack.isEmpty()) {
      let current = this.stack.pop();
      this.temp.push(current);

      if (current < this.minimum) {
        this._min = current;
      }
    }

    while (!this.temp.isEmpty()) {
      this.stack.push(this.temp.pop());
    }
  }

  push(value) {
    if (value < this.minimum) { this._min = value }

    return this.stack.push(value);
  }

  pop() {
    let popped = this.stack.pop();

    if (popped === this.minimum) {
      this.resetMinimum();
    }

    return popped;
  }
}

// Approach C: preferred algorithm: easy to visualize & no need for heavy
//            recalculation of minimum
class MinStack {
  constructor() {
    this.stack = new Stack();
    this.minVal = new Stack();
  }

  push(val) {
    if ( (val <= this.minVal.peek()) || this.minVal.isEmpty() ) {
      this.minVal.push(val);
    } else {
      this.minVal.push(this.minVal.peek());
    }

    return this.stack.push(val);
  }

  pop() {
    this.minVal.pop();
    return this.stack.pop();
  }

  get minimum() {
    return this.minVal.peek();
  }
}

let mStack = new MinStack();
mStack.push(1);
mStack.push(3);
console.log(mStack);
console.log(mStack.minimum);
mStack.push(-1);
console.log(mStack.minimum);
mStack.push(-2);
mStack.push(100);
mStack.push(9);
mStack.push(44);
console.log(mStack.minimum);
console.log(mStack);
mStack.pop();
mStack.pop();
mStack.pop();
mStack.pop();
console.log(mStack.minimum);
console.log(mStack);
mStack.pop();
mStack.pop();
mStack.pop();
console.log(mStack.minimum);
console.log(mStack);
