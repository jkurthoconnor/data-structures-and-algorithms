// Problem Statement:
//   implement a function which will take a stack and sort all of its elements in 
//   ascending order

//   in: stack of integers
//   out: the input stack with all elements sorted (ascending)

// Clarification:
//   'sort in ascednding order' means that the top of the stack will have the
//     lowest value in the stack
//
// Examples:
//    (see tests below)
//
// Data Structure:
//     holder array to contain values
//
// Alogrithm:
//    guard clause; return input if input is empty
//    init empty holder array
//
//    remove elements from stack:
//      while stack not empty, pop element and push onto holder array
//
//    sort holder array in reverse
//
//    iterate over holder array, pushing each element onto stack
//
//    return stack
//




// TIME: O(N logN) SPACE: O(N)
const Stack = require('./Stack.js');
const sortStack = stack => {
  const values = [];

  while (!stack.isEmpty()) {
    values.push(stack.pop());
  }

  values.sort( (a,b) => b - a );

  for (let val of values) {
    stack.push(val);
  }

  return stack;
};

// TESTS
const assert = require('assert').strict;

const compareArrayWStack = (expectedArray, stack) => {
  assert.equal(expectedArray.length, stack.size);   

  for (let val of expectedArray) {
    assert.equal(val, stack.pop());
  }
};

const makeStackFrom = arr => {
  const stack = new Stack();

  for (val of arr) {
    stack.push(val);
  }

  return stack;
};

const stack1 = makeStackFrom([23,60,12,42,4,97,2]);
const stack2 = makeStackFrom([60,2,23,4,12,42,97]);
const stack3 = makeStackFrom([2,4,12,23,42,60,97]);
const stack4 = makeStackFrom([10,9,8,7,6]);
const stack5 = makeStackFrom([7,4,7,4,9]);
const stack6 = makeStackFrom([]);

console.log('Running Tests ...');
compareArrayWStack([2,4,12,23,42,60,97], sortStack(stack1));
compareArrayWStack([2,4,12,23,42,60,97], sortStack(stack2));
compareArrayWStack([2,4,12,23,42,60,97], sortStack(stack3));
compareArrayWStack([6,7,8,9,10], sortStack(stack4));
compareArrayWStack([4,4,7,7,9], sortStack(stack5));
assert.equal(stack6, stack6);
console.log('...Tests Green');

