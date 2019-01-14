// Rearrange Postive & Negative Values 
//
// problem: Given an array of positive and negative numbers, implement a function which sorts the elements such that all the negative elements appear on the left and positive elements appear at the right
//
// PEDAC
//
//  in: array of positive and negative numbers
//  out: sorted array with all negative elements appearing at the left and positive appearing at the right
//    clarifications:
//      in-place sorting? instructions not explicit; could implement either way
//      place does not matter so long as all negative are to the left of all positive
//
// examples: see tests below
//
// algorithm #1: use convenience methods: 
//  create a method that returns the input sorted (via, e.g. `sort`)
//  Space: O(1) because array is sorted in place
//  Time: O(n logN) based on assumed standard sorting algorithm complexity
//
//  algorithm #2: in-place swapping without full sort
//    set negativeWriteIdx to first positive value
//    set reader to negativeWriteIdx + 1
//
//    while reader < input.length
//      while value at reader is not negative (or reader idx >= input.length)
//        reader ++
//     if reader idx < input.length 
//       swap values of negWriter and reader
//       negWriter++
//       reader++
//
//
// Space: O(1)
// Time: O(N)

// const reArrange = (array) => {
//   const length = array.length;
//   let writeNegativeIdx = array.findIndex( n => n >= 0);
//   let readIdx = writeNegativeIdx + 1;
//   if (writeNegativeIdx === -1) return array;

//   while (readIdx < length) {
//     while (array[readIdx] >= 0 && readIdx < length) {
//       readIdx++;
//     }

//     if (readIdx < length) {
//       [ array[readIdx], array[writeNegativeIdx] ] = [ array[writeNegativeIdx], array[readIdx] ];
//       readIdx++;
//       writeNegativeIdx++;
//     }
//   }
  
//   return array;
// };

// algorithm #3: don't waste potential full iteration on setting writer
//   adapt implementation of #2 to push writer forward until a positive value is found _while advancing the reader_
// Space: O(1)
// Time: O(N)

const reArrange = (array) => {
  const length = array.length;
  if (length < 1) return array;

  let writeNegativeIdx = 0;
  let readIdx = writeNegativeIdx + 1;

  while (readIdx < length) {
    if (array[writeNegativeIdx] < 0) {
      writeNegativeIdx++;
      readIdx++;
    }

    while (array[readIdx] >= 0 && readIdx < length) {
      readIdx++;
    }

    if (readIdx < length) {
      [ array[readIdx], array[writeNegativeIdx] ] = [ array[writeNegativeIdx], array[readIdx] ];
      readIdx++;
      writeNegativeIdx++;
    }
  }

  return array;
};


// TESTS
const assert = require('assert').strict;

const testReArrangedValues = (actual) => {
  let idxPositiveVal = actual.length;

  for (let idx = 0; idx < actual.length; idx++ ) {
    if (actual[idx] >= 0) {
      idxPositiveVal = idx;
      break;
    } 
  }

  let negSlice = actual.slice(0, idxPositiveVal);
  assert.equal(negSlice.some( x => x >= 0), false);

  let positiveSlice = actual.slice(idxPositiveVal);
  assert.equal(positiveSlice.some( x => x < 0), false);
};

// test given example
testReArrangedValues(reArrange([10, -1, 20, 4, 5, -9, -6]));
// test no positives in input
testReArrangedValues(reArrange([-1, -12, -100]));
// test no negatives in input
testReArrangedValues(reArrange([0, 97, 1, 14]));
// test already sorted input
testReArrangedValues(reArrange([-12, -11, -2, 0, 1, 100]));
// test reverse sorted input
testReArrangedValues(reArrange([1, 2, 3, 4, -1, -2, -3], 0));
// test edge case of empty input 
testReArrangedValues(reArrange([]));
// test edge case of single element input 
testReArrangedValues(reArrange([1]));


