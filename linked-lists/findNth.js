// Return the Nth node from the end
//
// Problem statement: You simply need to return the node which is N spaces away from the `null` end of the linked list
//
// I: a linked list, a position integer n
// O: the value of the node n positions from the end;
//    -1 if n is out of bounds
//
//
//  Examples and test cases: (see tests below)
//
//  Data Structure: a map to track places and values
//                  a counter to identify list length
//
//  Algorithm 1: (naive; not implemented below)
//    use two pointers:
//      one to traverse the list and identify/store the length
//      one to traverse the list to position (length - n - 1)
//        [index from 0]
//    return value at second pointer
//
//  Algorithm 2: uses map to prevent need for second traversal-
//    traverse list and store node values in a map at their idx {could use array instead}
//    return value stored at listLenght - n - 1
//
//  Algorithm 3: uses runners prespaced such that the end runner is spaced ahead
//    of the target runner the precise distance needed to ensure the target runner is
//    at the correct node when the end runner reaches the end of the list
//
//
const Node = require('./Node.js');
const ListTools = require('./BuildList.js');
const listTool = new ListTools();
const buildList =  listTool.buildList;

// Algorithm 2: SPACE: O(N) TIME: O(N)
const findNth = (list, n) => {
  const nodePlaces = new Map();
  let current = list.head.next;
  let currentPlace = -1;

  while (current !== null) {
    currentPlace += 1;
    nodePlaces.set(currentPlace, current.data);
    current = current.next;
  }

  return nodePlaces.get((currentPlace + 1) - n) || -1;
};

// Algorithm 3: SPACE: O(1) TIME: O(N)
const findNthSpacedRunners = (list, n) => {
  if ((n < 1) || (!list.head.next)) return -1;

  let endFinder = list.head.next;
  let targetFinder = list.head.next;
  let place = 1;

  while (place < n) {
    endFinder = endFinder.next;
    place += 1;
    if (endFinder === null) return -1;
  }

  while (endFinder.next !== null) {
    endFinder = endFinder.next;
    targetFinder = targetFinder.next;
  }

  return targetFinder.data;
};

// TESTS
const assert = require('assert').strict;

// setup data
const list1 = buildList([22,18,60,78,47,39,99]);
const list2 = buildList([15,22,8,6,14,21]);
const list3 = buildList([14,21,19,22,7]);
const list4 = buildList([]);
//
// run tests
console.log('Running Tests....');

assert.equal(findNth(list1, 3), 47);
assert.equal(findNth(list2, 4), 8);
assert.equal(findNth(list3, 1), 7);
assert.equal(findNth(list3, 5), 14);
assert.equal(findNth(list3, 9), -1);
assert.equal(findNth(list4, 1), -1);

assert.equal(findNthSpacedRunners(list1, 3), 47);
assert.equal(findNthSpacedRunners(list2, 4), 8);
assert.equal(findNthSpacedRunners(list3, 1), 7);
assert.equal(findNthSpacedRunners(list3, 5), 14);
assert.equal(findNthSpacedRunners(list3, 9), -1);
assert.equal(findNthSpacedRunners(list4, 1), -1);

console.log('Tests Green!');
