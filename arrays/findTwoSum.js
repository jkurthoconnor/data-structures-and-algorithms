// Given an array and a number, `n`, find two numbers from the array that sum to `n`. If two numbers are found, return them as a two-member array. If no two numbers that meet the criteria are found, return 'false'.

// PEDAC

//   in: array of numbers, `n`
//   out: if successful, an array of 2 numbers from input that sum to `n`;
//        if not successful, `false`

//   eg.
//     in: [1,21,3,14,5,60,7,6], 81
//     out: [21,60]

//     in: [], 12
//     out: false
  
//     in: [1], 12
//     out: false

//     in: [20,30,9,100], 50
//     out: [20,30]

//     in: [100, -20, 20, 10], 0
//     out: [-20, 20]

//     in: [20, 22, 19, 1], 20
//     out: [19, 1]

//   DS:
//     cache seen values in an object

//   Algorithm:
//     init seen cache/object
//     iterate over input array (allow early break/return)
//       - if seen has a key of n - element, return [n - element, element
//       - else add 'true' as value under seen[element]  
//     return false


// Space: O(N)
// Time: O(N)

const findSum = (array, n) => {
  const seen = {};
  for (let ele of array) {
    if (seen[n - ele]) return [n - ele, ele];
    seen[ele] = true;
  }

  return false;
};

console.log(findSum([1,21,3,14,5,60,7,6], 81));
console.log(findSum([20, 22, 19, 1], 20));
console.log(findSum([100, -20, 20, 10], 0));
console.log(findSum([20,30,9,10,50], 50));
console.log(findSum([1], 12));
console.log(findSum([], 12));
