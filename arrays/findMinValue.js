// Find the smallest number in a given array of integers.

// PEDAC

// in: array of integers
// out: lowest value integer in input

// examples:
//   in: [9,2,3,6]
//   out: 2

//   in: [-1, -12, 1, 12]
//   out: -12

//   in: [-12, -11, 1, 12] // target first
//   out: -12

//   in: [9, 100, 101, 50, -1] // target last

//   in: [0, 0, 0]
//   out: 0

//   in: []
//   out: []

// ds: lowestSeen variable

// algorithm:

// The most straightforward approach: 

//   Use a built-in convenience sorting method and then return the element at idx 0

//   - Time: O(n logn), based on typical time for built-in sort methods
//   - Space: O(1)

// More efficient option:
//   Iterate over collection, keeping track of the lowest seen value
//   Return lowest seen value

//   - Time: O(N)
//   - Space: O(1) 
const findMinimum = (array) => {
  if (array.length === 0) return array;
  let minSeen = Number.MAX_SAFE_INTEGER;

  for (let value of array) {
    if (value < minSeen) minSeen = value;
  }

  return minSeen;
};

console.log(findMinimum([9,2,3,6]));  // 2
console.log(findMinimum([-1, -12, 1, 12])); // -12
console.log(findMinimum([-12, -11, 1, 12])); // -12
console.log(findMinimum([0,0,0])); // 0
console.log(findMinimum([])); // []
