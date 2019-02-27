// Problem Statement:
//   implement a function which will take a stack and sort all of its elements in 
//   ascending order

//   in: stack of integers
//   out: the input stack with all elements sorted (ascending)

// Clarification:
//   'sort in ascednding order' means that the top of the stack will have the
//     lowest value in the stack
//     - elements will need to be pushed onto stack in descending order 
//       i.e., highest will be pushed first
//
// Examples:
//    (see tests below)
//
// Approach #1: use array as intermediary structure
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
//
// ****Preferred Approach****
//
// Approach #2: Native Stack-based Sorting
//
//  Data Structure: stack
//  Algorithm: visualize as two stacks loading/unloading/pushing value
//            onto a temp stack until the original stack is empty & thus 
//            holder is sorted in descending order (top is highest, bottom is lowest)
//            and then reload original stack by push/pop from holder
//
//    init empty holder stack
//    init tmp to hold single value
//
//  while stack is not empty
//    set tmp to stack.pop
//    if tmp >= holder.peek
//      holder.push(tmp)
//    else
//      until holder is empty or tmp >= holder.peek
//        stack.push(holder.pop)
//    holder.push(tmp)
//
//  while holder is not empty
//    stack.push holder.pop
//
//  return stack
//
//
//
// approach #1: array as intermediary structure
// TIME: O(N logN) SPACE: O(N)
const Stack = require('./Stack.js');
const sortStackViaArray = stack => {
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

// Approach #2: stack as intermediary structure
// TIME: O(N^2)  SPACE: O(N)
const sortStack = stack => {
  const holder = new Stack();
  let tmp;

  while (!stack.isEmpty()) {
    tmp = stack.pop();

    if (holder.isEmpty() || tmp >= holder.peek()) {
      holder.push(tmp)
    } else {
      while (holder.peek() !== null && tmp < holder.peek() ) {
        stack.push(holder.pop());
      }
      holder.push(tmp);
    }
  }

  while (!holder.isEmpty()) {
    stack.push(holder.pop());
  }

  return stack;
};

//
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

const stack0 = makeStackFrom([23,60,12]);
const stack1 = makeStackFrom([23,60,12,42,4,97,2]);
const stack2 = makeStackFrom([60,2,23,4,12,42,97]);
const stack3 = makeStackFrom([2,4,12,23,42,60,97]);
const stack4 = makeStackFrom([10,9,8,7,6]);
const stack5 = makeStackFrom([7,4,7,4,9]);
const stack6 = makeStackFrom([]);
const stack7 = makeStackFrom([7,-14,7,4,9]);

process.stdout.write('Running Tests ...');

compareArrayWStack([12,23,60], sortStack(stack0));
compareArrayWStack([2,4,12,23,42,60,97], sortStack(stack1));
compareArrayWStack([2,4,12,23,42,60,97], sortStack(stack2));
compareArrayWStack([2,4,12,23,42,60,97], sortStack(stack3));
compareArrayWStack([6,7,8,9,10], sortStack(stack4));
compareArrayWStack([4,4,7,7,9], sortStack(stack5));
assert.equal(stack6, stack6);
compareArrayWStack([-14,4,7,7,9], sortStack(stack7));

process.stdout.write('...Tests Green');

