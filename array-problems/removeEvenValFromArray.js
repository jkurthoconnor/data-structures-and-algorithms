// Remove all even valued integers from a given array
//   in: array of integers
//   out: array without even integers

//   examples:
//     in: [1,2,4,5,10,6,3]
//     out: [1,5,3]

//     in: [2,3,1,4]
//     out: [3,1]

//     in: [2,4,6]
//     out: []

//     in: [1,3,5,7]
//     out: [1,3,5,7]
//
// algorithm 0: convenience methods
//
  
  // const removeEven = array => {
  //   return array.filter( e => e % 2 === 1);
  // }
//

// algorithm 1: build and return new array
//  - init new / empty holder array
//  - iterate over input array
//    - if integer is not even, push onto holder array
//  - return holder array
//
// Space: O(N)
// Time: O(N)

const removeEven = (array) => {
  const odds = [];

  for (let n of array) {
    if (n % 2 === 1) {
      odds.push(n)
    }
  }

  return odds;
}

// algorithm 2: mutate input array
//  - iterate over input elements (use while loop to control advance)
//    - if element is even
//      - copy all subsequent elements one idx left
//      - reduce stop at value by one
//      - do not increment iteration value
//    - else increment iteration value
//
//  - set new length on mutated array
//  - return mutated input array
//
// Space: O(1)
// Time: O(N^2)

const removeEvenInPlace = (array) => {
  let len = array.length;
  let i = 0;

  while (i < len) {
    if (array[i] % 2 === 0) {
      array.splice(i, 1);
      len -= 1;
    }
    else {
      i += 1;
    }
  }

  return array;
}



console.log(removeEven([1,2,4,5,10,6,3]));
console.log(removeEven([2,3,1,4]));
console.log(removeEven([2,4,6]));
console.log(removeEven([1,3,5,7]));

console.log(removeEvenInPlace([1,2,4,5,10,6,3]));
console.log(removeEvenInPlace([2,3,1,4]));
console.log(removeEvenInPlace([2,4,6]));
console.log(removeEvenInPlace([1,3,5,7]));
