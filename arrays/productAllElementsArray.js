// Given an array of numbers, return an array where each index stores the product of all numbers in the array _except_ the number at the index itself.

// PEDAC

// in: array of numbers (integers, floats, negatives);

// out: array where each idx holds the product of all elements of the input _except_ the value at the same index in the input

// examples:
//   in: [1,2,3,4]
//   out: [24,12,8,6]

//   in: [4,2,1,5,0]
//   out: [0,0,0,0,40]

//   in: [0, 12, 100]
//   out: [1200, 0, 0]

//   in: [0, 12, 100, 0]
//   out: [0, 0, 0, 0]
//
//   in: [-1, -2, 10]
//   out: [-20, -10, 2]

//   in: [1.5, 2, 2]
//   out: [4, 3, 3]

//   in: []
//   out: []

//  in: [2]
//  out: [0]
//
// ds:
//   save product in constant
//   map new array to return

// algorithm:
//   init / calculate product constant

// (return) map array elements, where return element = product / element or 0, 
// based on a guard against division by 0:
  // One way to do this without relying on a series of costly (nested) O(N) convenience method calls is to precalculate the product minus any zeros in the collection, while also keeping a zero count. Then prepare a mapping of the elements to be returned based on the zero count

// Space: O(N)
// Time: O(N) [two O(N) processes]

const findProduct = (arr) => {
  if (arr.length === 0) return [];
  if (arr.length === 1) return [0];

  let zeroCount = 0;
  let productNoZeroFactors = 1;

  for (let val of arr) {
    if (val === 0) {
      zeroCount += 1;
    } else {
      productNoZeroFactors *= val;
    }
  }

  return arr.map( ele => {
    if (zeroCount === 1 && ele === 0) {
      return productNoZeroFactors;
    } else if (zeroCount > 1 || zeroCount === 1) {
      return 0;
    } else {
      return (productNoZeroFactors / ele);
    }
  });
};


console.log(findProduct([1,2,3,4]));
console.log(findProduct([4,2,1,5,0]));
console.log(findProduct([0,12,100]));
console.log(findProduct([0,12,100,0]));
console.log(findProduct([-1,-2,10]));
console.log(findProduct([1.5, 2, 2]));
console.log(findProduct([2]));
console.log(findProduct([]));

