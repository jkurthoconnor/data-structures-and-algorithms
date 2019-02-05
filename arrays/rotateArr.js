// Implement a function which will rotate a given array by `n`. That is, the rightmost elements will appear at the leftmost positions in the array.

// PEDAC
//   in: an array and an integer
//   out: the input array right rotated by n elements

// implicit definition: to rotate an element from the right (right rotation) is to remove the element  at the end of the array (idx array.length - 1) and place it at the start of the array (idx 0)

// examples:
//   see test cases below

// data structure:
//   in place rotation; no new structures required

// algorithm:
//   #1 using convenience methods
//     n times, `pop` the last element off, and use it as the argument for an `unshift` call
//     - e.g.: do n times: `array.unshift(array.pop());`
//     - Time: O(N * rotations)

//  #2  convenience methods with guard to prevent rotating more than array length times
//
// const rightRotate = (array, n) => {
//   let length = array.length;

//   if (length < 2 || length === n) return array;

//   if (n > length) {
//     n = n % length;
//   }

//   for (let count = 0; count < n; count++) {
//     array.unshift(array.pop());
//   }

//   return array;
// };
  
//   #3 'manual' rotation with guard to prevent rotating more than array length times

// Space: O(1)
// Time: O(N * N -1)
const rightRotate = (array, n) => {
  const length = array.length;
  if (length < 2 || n % length === 0) return array;

  if (n > length) {
    n = (n % length);
  }

  for (let count = 0; count < n; count++) {
    let tailVal = array[length - 1]; 

    for (let i = length - 1; i > 0; i--) {
      array[i] = array[i - 1];
    }

    array[0] = tailVal;
  }

  return array;
};

// TESTS
const assert = require('assert').strict;

const testRotation = (actual, expected) => {
  assert.equal(actual.length, expected.length);

  for (let i = 0; i < expected.length; i++) {
    assert.equal(actual[i], expected[i]);
  }
};

// test single rotation
testRotation(rightRotate([9,2,3,6], 1), [6,9,2,3]);
// test multiple rotation
testRotation(rightRotate([4,3,1,5,0], 4), [3,1,5,0,4]);
// test full rotation: n = array length
testRotation(rightRotate([4,3,1,9,5,10], 6), [4,3,1,9,5,10])
// test full + rotation: n > array length
testRotation(rightRotate([4,3,1,9,5,10], 9), [9,5,10,4,3,1]);
// test edge case of no rotation: n = 0 
testRotation(rightRotate([1,2,3,4], 0), [1,2,3,4]);
// test edge case of empty array 
testRotation(rightRotate([], 4), []);
// test edge case of single element array 
testRotation(rightRotate([1], 4), [1]);

