// Given an array of integers, find the first unique integer in the array

// PEDAC

//   in: array of integers
//   out: first unique integer
//     - 'first': earliest occurance / lowest index (_not_ lowest value)


// examples:
//   in: [9,2,3,2,6,6]
//   out: 9

//   in: [4,5,1,2,0,4]
//   out: 5

//   in: [-1, -2]
//   out: -1     // first unique by idx, not by value

// in: [1,1,2,2,3,3]
// out: []

// algorithm:
//   1. intuitive but slow: O(N^2)
  
//     - initialize a seen object
//     - iterate through array
//       - if value has been seen, continue to next iteration
//       - if current index equals index of last occurance of value, return value
//          - [must find last index, hence quadratic time]
//       - set seen[value] to true
//     - return empty array (or some other default) if iteration through entire array does not identify a unique element


// Time: O(N^2) due to `lastIndexOf`

// const findFirstUnique = (array) => {
//   const seen = {};

//   for (let i = 0; i < array.length; i++) {
//     let value = array[i];

//     if (seen[value]) continue;
//     if (i === array.lastIndexOf(value)) return value;
//     seen[value] = true;
//   }

//   return [];
// };

// algorithm;
//  2: less intuitive, uses cache to record both available idx or unavailable
//
// Space: O(N)
// Time: O(N + N) = O(N)
const findFirstUnique = (array) => {
  const seen = {};

  for (let i = 0; i < array.length; i++) {
    let value = array[i];
    if (seen[value] !== undefined) {
      seen[value] = 'not unique';
    } else {
      seen[value] = i;
    }
  }

  for (let value of array) {
    if (Number.isInteger(seen[value])) return value;
  }

  return [];
};

console.log(findFirstUnique([9,2,3,2,6,6]));  // 9
console.log(findFirstUnique([4,5,1,2,0,4]));  // 5
console.log(findFirstUnique([-1, -2]));  // -1
console.log(findFirstUnique([1,1,2,2,3,3]));  // []
