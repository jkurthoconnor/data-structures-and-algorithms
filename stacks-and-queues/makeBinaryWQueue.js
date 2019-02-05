// Problem Statement:
//   Implement a function `findBin(n) which will generate binary numbers from 1 to n in the form of a string using a queue.
//
// Input: positive integer, n
// Output: binary numbers (as strings) from 1 up to n
//
// Examples:
//   in: 3, out: ['1', '10', '11']
//   in: 5, out: ['1', '10', '11', '100', '101']
//   in: 10 out: ['1', '10', '11', '100', '101', '110', '111', '1000', '1001', '1010']





// TIME: O(N) SPACE: O(N)
const Queue = require('./Queue.js');
const findBin = n => {
  if (n === 0) return null;

  let result = [];
  let q = new Queue();

  q.enqueue('1');

  for (let count = 0; count < n; count++) {
    let last = q.dequeue();
    q.enqueue(last + '0');
    q.enqueue(last + '1');
    result.push(last);
  }

  return result;
};


// TESTS
const assert = require('assert').strict;
//
// set up function to generate expected values
const makeBinarySeriesTo = limit => {
  let series = [];
  let current = 1;

  while (current <= limit) {
    series.push(current.toString(2));
    current += 1;
  }

  return series.join();
};

console.log('Running tests ....');

assert.equal(findBin(0), null);
assert.equal(findBin(1).join(), makeBinarySeriesTo(1));
assert.equal(findBin(3).join(), makeBinarySeriesTo(3));
assert.equal(findBin(5).join(), makeBinarySeriesTo(5));
assert.equal(findBin(10).join(), makeBinarySeriesTo(10));
assert.equal(findBin(100).join(), makeBinarySeriesTo(100));

console.log('All tests green.');
