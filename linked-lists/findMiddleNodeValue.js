// Find Middle Value of Linked List
//
//  statement: 
//    - Implement a findMid() function which will take a linked list as an input and return the value of the _middle node_.
//
//  PEDAC
//
//  I: singly linked list
//  O: integer value of middle node
//
//    middle node: 
//      - odd length list: (length / 2) + 1  << integer division
//      - even length list: length / 2
//
//    clarification:
//      - nodes are indexed from 1 
//  
//  Examples: see tests below
//
//  Data Structure:
//    if length property is available, no data struct needed
//    without length property, use map object to hold seen by place/idx
//
//  Algorithm:
//    #1:  SPACE: O(1) TIME: O(N)
//    (assumes length property access and use of custom class methods) 
//
//    guard clause for empty list as input
//    determine middle node:  Math.ceil(list.length / 2);
//    access middle node: list.findNodeAt(middle - 1);
//        - NB: return value format: [nodeAtIDX, nextNode]
//    return middle node's value
// 
//    #2:  SPACE: O(N) TIME: O(N)
//    (no access to built-in length property or convenience methods)
//
//    initialize `valueAt` map object
//    initialize length to 0
//    initialize current to list.head.next
//
//    traverse list (while current)
//      length += 1
//      store node's value in `valueAt` under length key
//      current = current.next
//    
//    if length is 0, return list, 
//    else return `valueAt` Math.ceil(list.length / 2);


const Node = require('./Node.js');
const ListTools = require('./BuildList.js');
const listTool = new ListTools();
const buildList =  listTool.buildList;

// solution that assumes built-in length and convenience methods
const findMiddle = list => {
  if (list.length === 0) return null;

  const middle = Math.ceil(list.length / 2);
  const [middleNode, _unused] = list.findNodeAt(middle);

  return middleNode.data;
};


// solution that does not assume built-in length access
const findMiddleNoLengthAccess = list => {
  const valueAt = new Map();
  let length = 0;
  let current = list.head.next;

  while (current) {
    length += 1;
    valueAt.set(length, current.data);
    current = current.next;
  }

  if (length === 0) {
    return null;
  } else {
    return valueAt.get(Math.ceil(length / 2));
  }
};


// TESTS
const assert = require('assert').strict;

const list1 = buildList([1,2,3]);
const list2 = buildList([1,2,3,4,9,5,4]);
const list3 = buildList([7,14,10,21]);
const list4 = buildList([7,14,10,21,21]);
const list5 = buildList([]);
const list6 = buildList([2]);

assert.equal(findMiddle(list1), 2);
assert.equal(findMiddle(list2), 4);
assert.equal(findMiddle(list3), 14);
assert.equal(findMiddle(list4), 10);
assert.equal(findMiddle(list5), null);
assert.equal(findMiddle(list6), 2);


assert.equal(findMiddleNoLengthAccess(list1), 2);
assert.equal(findMiddleNoLengthAccess(list2), 4);
assert.equal(findMiddleNoLengthAccess(list3), 14);
assert.equal(findMiddleNoLengthAccess(list4), 10);
assert.equal(findMiddleNoLengthAccess(list5), null);
assert.equal(findMiddleNoLengthAccess(list6), 2);






