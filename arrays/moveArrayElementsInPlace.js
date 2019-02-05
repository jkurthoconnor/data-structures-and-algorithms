// O(N) time, in place movement of array element

let array = [1,2,3,4,5,6,7,8,3,3];
let array2 = ['a','b','c','d','e'];

const moveFromTo = (arr, fromIdx, destIdx) => {
  const source = arr[fromIdx];

  if (fromIdx < destIdx) {
    copyValuesLeft(arr, fromIdx, destIdx);
  } else if (fromIdx > destIdx) {
    copyValuesRight(arr, fromIdx, destIdx);
  }

  arr[destIdx] = source;
};

const copyValuesLeft = (source, start, stop) => {
  let writer = start;
  let reader = start + 1;

  while (reader <= stop) {
    source[writer] = source[reader];
    writer++;
    reader++;
  }
};

const copyValuesRight = (source, start, stop) => {
  let writer = start;
  let reader = start - 1;

  while (reader >= stop) {
    source[writer] = source[reader];
    writer--;
    reader--;
  }
};

console.log(array);
moveFromTo(array, 4, 7)
console.log(array);

console.log(array2);
moveFromTo(array2, 3, 1)
console.log(array2);




// remove and store value at fromIdx
// close the gap by sliding forward/backward into fromIdx
//   'sliding' is writing over neighbor
//     if destIdx > fromIdx
//       set writer to fromIdx
//       set reader to fromIdx + 1
//       loop until reader > destIdx
//         arr[writer] = arr[reader]
//         writer ++
//         reader ++
//     if destIdx < fromIdx
//         set writer to fromIdx
//         set reader to fromIdx - 1
//           loop until reader < destIdx

//   insert (write over value) at destIdx


