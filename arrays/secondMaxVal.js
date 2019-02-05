 /* Implement a function which returns the second largest element in an array of integers. */

 /* PEDAC */
 /*   in: array of integers */
 /*   out: integer, the second largest in input */
 /*       clarify: 'second largest' requires at least two distinct values; */
 /*                 duplicate values count only 1x */
 /*   examples: */
 /*     see tests below */

 /*   data structure: */
 /*     hash / (or JS Map) holding current values for largest and second largest */

 /*   algorithm: */
 /*     guard clause: return nil if input size < 2 */
 /*     init hash, largest: '-Infinity', second_largest: '-Inifinity' */

 /*     iterate over array: */
 /*       if current value <= second_largest */
 /*         next */
 /*       if current value > largest */
 /*         second_largest = largest */
 /*         largest = current value */
 /*       if current value > second_largest && current value < greatest */ 
 /*         second_largest = current value */

 /*         return hsh[:second_largest] if it is greater than -infinity, else return nil */

// Space: O(1) for the map object
// Time: O(N)

const assert = require('assert').strict;

const findSecondMax = (array) => {
  const values = new Map([ ['greatest', array[0]] ]);

  for (let value of array) {
    let max = values.get('greatest');
    let second = values.get('second') || -Infinity;

    if (value <= second) continue;

    if (value > max) {
      values.set('second', max);
      values.set('greatest', value);
    } else if ( (value > second) && (value < max) ) {
      values.set('second', value);
    }
  }

  return values.get('second');
};


// test_finds_target_at_last_idx
  assert.equal(findSecondMax([9,2,3,6]), 6)

// test_finds_target_at_first_idx
  assert.equal(findSecondMax([4,3,1,5,0]), 4)

// test_finds_target_in_middle
  assert.equal(findSecondMax([4,3,1,9,5,10]), 9)

// test_does_not_confuse_duplicates_with_different_value_rank
  assert.equal(findSecondMax([4,3,1,9,5,10,10]), 9)

// test_returns undefined_for_target_not_found
  assert.equal(findSecondMax([8,8,8,8]), undefined)

// test_returns undefined_for_target_not_found_empty_input
  assert.equal(findSecondMax([]), undefined)

// test_returns undefined_for_target_not_found_single_value_input
  assert.equal(findSecondMax([22]), undefined)

