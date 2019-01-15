const assert = require('assert').strict;
const Node = require('./Node.js');

const node2 = new Node(2);
const node1 = new Node(1, node2);
const node3 = new Node(3);

assert(node1);
assert(node1 instanceof Node);

assert.equal(node1.next, node2);
assert.equal(node1.value, 1);

assert.equal(node2.next, null);
assert.equal(node1.next.next, null);

node1.value = 11;
assert.equal(node1.value, 11);

node2.next = node3;
assert.equal(node2.next, node3);

node2.next = null;
assert.equal(node2.next, null);

// node3.next = node3;
// assert.throws(node3.next = 'hello');

