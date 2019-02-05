// Return the Union of two singly linked lists
//
// Problem statement: Implement a union function. The union function should take two linked lists as input and return their union
//
// I: two singly linked lists
// O: a list representing the union of the inputs
//
//  definition'__union__':  given two lists, A and B, the union is the list that contains elements or objects that belong to either A or to B or to both
//    - Note: a union is a set, and sets do not contain duplicates
//
//  Examples and test cases: (see tests below)
//
//  Data Structure: hash/Map to store seen values
//
//  Alogrithm:
//    (assumes no built-in `deleteAt` or `removeDuplicates` list methods)
//    initialize `seenVals` hash/Map
//    initialize `current` and `previous` pointers for list1
//    initialize listsJoined to false
//
//    iterate list1 while current node exists
//      if value at current node is in the seen hash/Map, delete node
//      else insert value into seen, node's value as key, `true` as value
//
//      if next node is null and listsJoined is false, current node = list1.head.next
//      else current node = current node next
//
//    return list
//
//  Algorithm 2: build Set from values of both lists; create/return new list from Set



const Node = require('./Node.js');
const ListTools = require('./BuildList.js');
const listTool = new ListTools();
const buildList =  listTool.buildList;

// SPACE: O(N) TIME: O(N) where N = combined lengths of lists
const union = (list1, list2) => {
  if ((list1.head.next === null) && (list2.head.next === null)) return list1;

  const seenVals = new Map();
  let listsJoined = false;

  if (list1.head.next === null) {
    list1.head.next = list2.head.next;
    list2.head.next = null;
    listsJoined = true;
  }

  let current = list1.head.next;
  let previous = list1.head;

  while (current !== null) {
    if (seenVals.has(current.data)) {
      previous.next = current.next;
      current.next = null;
      current = previous.next;
    } else {
      seenVals.set(current.data, true);
      previous = current;
      current = current.next;
    }

    if ((current === null) && !listsJoined) {
      listsJoined = true;
      current = list2.head.next;
      previous.next = current;
    }
  }
  return list1;
};

// using a Set to hold values, then build new list, offloads duplicate checks
// to the data structure
const unionWithSet = (list1, list2) => {
  const uniqueVals = new Set();

  const extractVals = (list) => {
    let current = list.head.next;

    while (current !== null) {
      uniqueVals.add(current.data);
      current = current.next
    }
  };

    extractVals(list1);
    extractVals(list2);

  return buildList([...uniqueVals]);
};


// TESTS
const assert = require('assert').strict;

// setup data
const list1 = buildList([10,20,80,60]);
const list2 = buildList([15,20,30,60,45]);
const list3 = buildList([7,14,21,14,22,7]);
const list4 = buildList([1,2,2,2,3,4,4,5,6]);
const list5 = buildList([1,2,3]);
const list6 = buildList([1]);
const list7 = buildList([]);
const list8 = buildList([10]);
const list9 = buildList([]);
const list10 = buildList([]);

// assertion function; test does not assume value/node order is significant
const compareListValues = (list, expectedValues) => {
  let actualValues = [];
  let current = list.head.next;

  while (current !== null) {
    actualValues.push(current.data);
    current = current.next;
  }

  expectedValues.sort((a,b) => a - b);
  actualValues.sort((a,b) => a - b);

  let idx = 0;

  while ((idx < actualValues.length) || (idx < expectedValues.length)) {
    assert.equal(actualValues[idx], expectedValues[idx]);
    idx += 1;
  }
};


// run tests
// NB: unionWithSet tests must be run first; union mutates input
compareListValues(unionWithSet(list1, list2), [10,20,80,60,15,30,45]);
compareListValues(unionWithSet(list3, list4), [1,2,3,4,5,6,7,14,21,22]);
compareListValues(unionWithSet(list5, list6), [1,2,3]);
compareListValues(unionWithSet(list7, list8), [10]);
compareListValues(unionWithSet(list9, list10), []);

compareListValues(union(list1, list2), [10,20,80,60,15,30,45]);
compareListValues(union(list3, list4), [1,2,3,4,5,6,7,14,21,22]);
compareListValues(union(list5, list6), [1,2,3]);
compareListValues(union(list7, list8), [10]);
compareListValues(union(list9, list10), []);

