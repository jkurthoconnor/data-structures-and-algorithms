// Problem Statement: reverse the first 'k' elements in a given queue
//
// input: a queue; an integer representing the number of elements to be reversed
// output: a queue with 'k' elements reversed
//
//  clarification: problem does not specify if solution should be in-place;
//             write algorithms for each possibility
//
// Examples: (see test cases below)
//      note decision to return `null` if k is > or < queue length
//
//
//  #1 (out of place solution) TIME: O(N + k) SPACE: O(N + k)
//  
//  Data Structures:
//    result queue
//    stack for reversing queue elements
//
//  Algorithm:
//    init result queue
//    intit temp stack
//    guard clause: return null if k is > or < queue length
//
//    dequeue 1st k elements & push them onto temp stack
//    pop elements off of temp stack & enqueue them into result queue
//    dequeue remainint elements from input queue and enqueue them into result
//      queue
//    return result queue
//

const Queue = require('./Queue.js');
const Stack = require('./Stack.js');

// out of place solution
// TIME: O(N + k) SPACE: O(N + k)
const reverseK = (q, k) => {
  if (q.size < k || k < 1) return null;

  let resultQ = new Queue();
  let reversingStack = new Stack();

  for (let n = 1; n <= k; n++) {
    reversingStack.push(q.dequeue());
  }

  while (reversingStack.size > 0) {
    resultQ.enqueue(reversingStack.pop());
  }

  while (q.size > 0) {
    resultQ.enqueue(q.dequeue());
  }

  return resultQ;
};

//  #2 (in-place solution) TIME: O(N + k) SPACE: O(k)
//  
//  Data Structures:
//    temp stack to reverse order
//    var to hold queue size - k
//
//  Algorithm:
//    init temp stack
//    init unreversedCount var to input queue.size - k ??
//
//    build stack of 1st k elements of input queue by pushing onto stack the 
//      returned value from dequeueing
//
//    enqueue the elements from the stack by enqueueing the returned values
//      from popping elements off the stack until the stack is empty
//
//    move the unreversed elements from the front of the queue and place on the back
//      without changing relative order by enqueueing the returned value of dequeueing
//      unreversedCount times
//
//

// in-place solution. TIME: O(N + k) SPACE: O(k)
const reverseKinPlace = (q, k) => {
  if (q.size < k || k < 1) return null;

  const reverseStack = new Stack();
  const finalRotations = q.size - k;

  for (let i = 1; i <= k; i++) {
    reverseStack.push(q.dequeue());
  }

  while (reverseStack.size > 0) {
    q.enqueue(reverseStack.pop());
  }

  for (let i = 1; i <= finalRotations; i++) {
    q.enqueue(q.dequeue());
  }

  return q;
};


// TESTS
const assert = require('assert').strict;

const prepTestQueue = array => {
  const q = new Queue();

  for (let e of array) {
    q.enqueue(e);
  }

  return q;
};


console.log('Running tests....');

// out of place solution
let queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseK(queue1, 10).elements.join(), [10,9,8,7,6,5,4,3,2,1].join());

queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseK(queue1, 5).elements.join(), [5,4,3,2,1,6,7,8,9,10].join());

queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseK(queue1, 4).elements.join(), [4,3,2,1,5,6,7,8,9,10].join());

queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseK(queue1, 3).elements.join(), [3,2,1,4,5,6,7,8,9,10].join());

queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseK(queue1, 2).elements.join(), [2,1,3,4,5,6,7,8,9,10].join());

queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseK(queue1, 1).elements.join(), [1,2,3,4,5,6,7,8,9,10].join());

queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseK(queue1, 0), null);

queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseK(queue1, 11), null);

// in place solution
queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseKinPlace(queue1, 10).elements.join(), [10,9,8,7,6,5,4,3,2,1].join());

queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseKinPlace(queue1, 5).elements.join(), [5,4,3,2,1,6,7,8,9,10].join());

queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseKinPlace(queue1, 4).elements.join(), [4,3,2,1,5,6,7,8,9,10].join());

queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseKinPlace(queue1, 3).elements.join(), [3,2,1,4,5,6,7,8,9,10].join());

queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseKinPlace(queue1, 2).elements.join(), [2,1,3,4,5,6,7,8,9,10].join());

queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseKinPlace(queue1, 1).elements.join(), [1,2,3,4,5,6,7,8,9,10].join());

queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseKinPlace(queue1, 0), null);

queue1 = prepTestQueue([1,2,3,4,5,6,7,8,9,10]);
assert.equal(reverseKinPlace(queue1, 11), null);

console.log('Tests green');
