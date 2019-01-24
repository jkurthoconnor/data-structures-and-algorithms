// Remove Duplicates from Linked List
//
// Problem statement: Implement a remove duplicates function. When a linked list is passed to this function, it removes any node which is a duplicate of another existing node.
//
// I: a singly linked list
// O: a list with all duplicates removed
//  clarification:'duplicates' refers to duplicate _values_
//
//  Examples and test cases: (see tests below)
//  
//  Data Structure: hash/Map to store seen values
//
//  Alogrithm:
//    (assumes no built-in `deleteAt` list method)
//    initialize `seenVals` hash/Map
//    initialize `current` and `previous` pointers
//
//    iterate list while current node exists
//      if value at current node is in the seen hash/Map, delete node
//      else insert value into seen, node's value as key, `true` as value
//
//    return list


const Node = require('./Node.js');
const ListTools = require('./BuildList.js');
const listTool = new ListTools();
const buildList =  listTool.buildList;

// SPACE: O(N) TIME: O(N)
const removeDupes = list => {
  const seen = new Map();
  let previous = list.head;
  let current = list.head.next;

  while (current !== null) {
    if (seen.has(current.data)) {
      previous.next = previous.next.next;
      current.next = null;
      current = previous.next;
    } else {
      seen.set(current.data, true);
      previous = current;
      current = current.next;
    }
  }

  return list;
};

// TESTS
const assert = require('assert').strict;

const list1 = buildList([7,14,21,14,22,7]);
const list2 = buildList([1,2,2,2,3,4,4,5,6]);
const list3 = buildList([1,2,3]);
const list4 = buildList([1]);
const list5 = buildList([]);

const compareListValues = (list, expectedValues) => {
  const uniqueList = removeDupes(list);
  let current = uniqueList.head.next;

  const length = expectedValues.length;
  let comparisonIdx = 0;

  while ((current !== null) || (comparisonIdx < length)) {
    assert.equal(current.data, expectedValues[comparisonIdx]);
    comparisonIdx += 1;
    current = current.next;
  }
};


compareListValues(list1, [7,14,21,22]);
compareListValues(list2, [1,2,3,4,5,6]);
compareListValues(list3, [1,2,3]);
compareListValues(list4, [1]);
compareListValues(list5, []);
