const assert = require('assert').strict;
const Stack = require('./Stack.js');

let stack1 = new Stack();

console.log('Running Tests ...');

assert.equal(stack1.peek(), null);
assert.equal(stack1.isEmpty(), true);
assert.equal(stack1.size, 0);
assert.equal(stack1.pop(), null);

stack1.push(4);
assert.equal(stack1.peek(), 4);
assert.equal(stack1.isEmpty(), false);
assert.equal(stack1.size, 1);


stack1.push(5);
assert.equal(stack1.peek(), 5);
assert.equal(stack1.isEmpty(), false);
assert.equal(stack1.size, 2);

stack1.push(6);
assert.equal(stack1.peek(), 6);
assert.equal(stack1.isEmpty(), false);
assert.equal(stack1.size, 3);

stack1.pop();
assert.equal(stack1.peek(), 5);
assert.equal(stack1.isEmpty(), false);
assert.equal(stack1.size, 2);

stack1.pop();
stack1.pop();
assert.equal(stack1.peek(), null);
assert.equal(stack1.isEmpty(), true);
assert.equal(stack1.size, 0);
assert.equal(stack1.pop(), null);

console.log('Tests Green');

