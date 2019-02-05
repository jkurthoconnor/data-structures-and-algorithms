//By definition, a loop is formed when a node in the linked list points to a previously traversed node.

//Implement a detectLoop function which will take a linked list as input and deduce whether or not a loop is present

// PEDAC
//  I: singly linked list
//  O: true if input list contains a loop; false if input does not contain a loop
// 
//  Data Structure:
//    use a Map (in either JS or Ruby) to save a record of seen nodes
//      - key is the seen node; value is true
//    iterate the list
//      if seen[node] return true
//      seen[node] = true
//
//    return false
// 
// TIME: O(N)
// SPACE: O(N)

const Node = require('./Node.js');
const ListTools = require('./BuildList.js');
const listTool = new ListTools();
const buildList =  listTool.buildList;

const detectLoop = list => {
  const seen = new Map();
  let current = list.head.next;

  while (current) {
    if (seen.has(current)) return true;
    seen.set(current, true);

    current = current.next;
  }

  return false;
};

// TESTS
const assert = require('assert').strict;
const loopedList1 = buildList([1,2,3,4,5])
loopedList1.head.next._next = loopedList1.head.next;  // uses property `_next` to avoid loop
                                         // guard built into the setter `next`
const list = buildList([1,2,3,4,4,5,4]);

assert(!detectLoop(list));
assert(detectLoop(loopedList1));






