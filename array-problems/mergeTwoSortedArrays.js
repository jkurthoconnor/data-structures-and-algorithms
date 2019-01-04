// Given two sorted arrays, merge them into a new array, also sorted.
//
// in: two sorted arrays (low to high)
// out: one, new sorted array combining inputs
//
// eg.:
//  in: [1,3,4,5], [2,6,7,8]
//  out: [1,2,3,4,5,6,7,8]
//
//  in: [2],  [1]
//  out: [1,2]
//
//  in: [], []
//  out: []
//
//  in: [-1, 0, 2, 9], [-4, 0, 2, 21]
//  out: [-4, -1, 0, 0, 2, 2, 9, 21]
//
//  algorithm:
//    init empty sorted / result array
//    set pointers to 0 for a1 reader, a2 reader 
//
//    while a1 reader & a2 reader is < its array's length
//      if a1 value <= a2 value, push a1 to results & increment a1
//      else push a2 value to results & increment a2
//
//    if a1 reader is >= its array's length, push remaining values from a2 onto result; elsif a2 reader is >= array's lenght, push remaining values from a1 onto results
//
//    return results
//
// N = array1 length; M = array2 length
// Space: O(N+M)
// Time: O(N+M)

const mergeArrays = (a1, a2) => {
  const merged = [];
  let [a1Reader, a2Reader] = [0, 0];
  const [a1Length, a2Length]= [a1.length, a2.length];

  while ( (a1Reader < a1Length) && (a2Reader < a2Length) ) {
    if (a1[a1Reader] <= a2[a2Reader]) {
      merged.push(a1[a1Reader]);
      a1Reader += 1;
    } else {
      merged.push(a2[a2Reader]);
      a2Reader += 1;
    }
  }

  if (a1Reader < a1Length) {
    merged.push(...a1.slice(a1Reader));
  } else if (a2Reader < a2Length) {
    merged.push(...a2.slice(a2Reader));
  }

  return merged;
};

console.log(mergeArrays([], []));
console.log(mergeArrays([1], [-1]));
console.log(mergeArrays([1,3,4,5], [2,6,7,8]));
