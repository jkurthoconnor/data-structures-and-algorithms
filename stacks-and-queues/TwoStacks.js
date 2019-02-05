// Problem Statement: implement two stacks using a single array to store elements
//
// strategy:
//  track a length value for each stack
//  one stack works from the 'front' of the array, e.g. array shift / unshift 
//  one stack works from the 'back' of the array, e.g. array pop / push
//  if at any point the stack in question's length is 0, return null for any pop request


// because implementation uses `shift` and `unshift` for stack1 operations,
// operations on stack1 are O(N)
// operations on stack2 are O(1)

class twoStacks {
  constructor() {
    this.data = new Array();
    this.stack1_length = 0;
    this.stack2_length = 0;
  }

  push1(val) {
    this.data.unshift(val);
    this.stack1_length += 1;
  }

  pop1() {
    if (this.stack1_length === 0) {
      return null;
    } else {
      this.stack1_length -= 1;
      return this.data.shift();
    }
  }

  push2(val) {
    this.data.push(val);
    this.stack2_length += 1;
  }

  pop2() {
    if (this.stack2_length === 0) {
      return null;
    } else {
      this.stack2_length -= 1;
      return this.data.pop();
    }
  }
}

// TESTS

const assert = require('assert').strict;

console.log('Running Tests ...');

const dualStack = new twoStacks();
assert.equal(dualStack.stack1_length, 0);
assert.equal(dualStack.stack2_length, 0);
assert.equal(dualStack.pop1(), null);
assert.equal(dualStack.pop2(), null);

dualStack.push1('s1-1');
dualStack.push1('s1-2');
assert.equal(dualStack.stack1_length, 2);


dualStack.push2('s2-1');
dualStack.push2('s2-2');
assert.equal(dualStack.stack2_length, 2);

assert.equal(dualStack.pop2(), 's2-2');
assert.equal(dualStack.pop2(), 's2-1');
assert.equal(dualStack.stack2_length, 0);
assert.equal(dualStack.pop2(), null);

assert.equal(dualStack.pop1(), 's1-2');
assert.equal(dualStack.pop1(), 's1-1');
assert.equal(dualStack.stack1_length, 0);
assert.equal(dualStack.pop1(), null);

console.log('Tests Green');
