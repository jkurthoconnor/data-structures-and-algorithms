// Rearrange Postive & Negative Values 
const maxMin = (array) => {
  let reArranged = [];
  let max = array.length - 1;
  let min = 0;

  while (max > min) {
    reArranged.push(array[max], array[min]);
    max--;
    min++;
  }

  if (max === min) reArranged.push(array[max]);

  return reArranged;
};


// TESTS
const assert = require('assert').strict;

const testReArrangedValues = (actual) => {
  let comparison = [...actual].sort( (a, b) => a - b);

  while (comparison.length > 1) {
    assert.equal(actual[0], comparison[comparison.length - 1]);
    assert.equal(actual[1], comparison[0]);

    comparison = comparison.splice(1, comparison.length - 2);
    actual = actual.slice(2);
  }

  if (comparison.length === 1) {
    assert.equal(actual[actual.length - 1], comparison[0]);
  }
};

// test given example 1
testReArrangedValues(maxMin([1,2,3,4,5,6,7]));
// test given example 2
testReArrangedValues(maxMin([1,2,3,4,5]));
// test even length input
testReArrangedValues(maxMin([1,2,4,5]));
// test no positives in input
testReArrangedValues(maxMin([-100, -12, -1]));
// test fractional input elements
testReArrangedValues(maxMin([0, 0.1, 9, 9.75, 14]));
// test edge case of empty input
testReArrangedValues(maxMin([]));
// test edge case of single element input
testReArrangedValues(maxMin([1]));
