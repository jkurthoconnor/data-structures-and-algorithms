const assert = require('assert').strict;
// const Queue = require('./Queue.js');
const Queue = require('./QueueFromTwoStacks');

let queue1 = new Queue();

console.log('Running Tests ...');

assert.equal(queue1.size, 0);
assert.equal(queue1.isEmpty(), true);
assert.equal(queue1.peek(), null);
assert.equal(queue1.dequeue(), null);

queue1.enqueue(1);
assert.equal(queue1.size, 1);
assert.equal(queue1.isEmpty(), false);
assert.equal(queue1.peek(), 1);

queue1.enqueue(2);
queue1.enqueue(3);
queue1.enqueue(4);
assert.equal(queue1.size, 4);
assert.equal(queue1.isEmpty(), false);
assert.equal(queue1.peek(), 1);

queue1.dequeue();
assert.equal(queue1.dequeue(), 2);
assert.equal(queue1.size, 2);
assert.equal(queue1.isEmpty(), false);
assert.equal(queue1.peek(), 3);

queue1.dequeue();
queue1.dequeue();
assert.equal(queue1.size, 0);
assert.equal(queue1.isEmpty(), true);
assert.equal(queue1.peek(), null);

console.log('Tests Green');

