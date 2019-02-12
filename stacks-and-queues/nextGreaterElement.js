// Problem Statement:
//   implement a nextGreater function. Fr each element in an array, it finds the next greater element in the array. To keep it simple, the next greater element for the last or maximum value is -1

// in: an integer array
// out: array containing the next greater element of each element from the inupt array.

//   Clarifications:
//      'next greater element': for a given element (A) the first element that is
//      both greater than (A) and follows (A) in the array's order
//
//   Examples and Test Cases:
//    (see tests below)
//
//  Data Structure:
//    Stack
//
//  




// TODO: develop an algorithm & refactor using a stack
const Stack = require('./Stack.js');
const assert = require('assert').strict;

const nextGreater = arr => {
  const result = new Array();

  for (let i = 0; i < arr.length; i++) {
    for (let j = i; j < arr.length; j++) {
      if (arr[j] > arr[i]) {
        result.push(arr[j]);
        break;
      }

      if (j === arr.length - 1) result.push(-1)
    }
  }

  return result;
};

console.log(nextGreater([4,6,3,2,8,1]));


// TESTS

const compareArrayValues = (actual, expected) => {
  assert.equal(actual.length, expected.length);

  for (let i = 0; i < actual.length; i++) {
    assert.equal(actual[i], expected[i]);
  }
};



process.stdout.write('Running Tests...');

compareArrayValues(nextGreater([4,6,3,2,8,1]), [6,8,8,8,-1,-1]);

process.stdout.write('...Tests Green');
