// Return the Intersection of two singly linked lists
//
// Problem statement: Implement an intersection function. The union function should take two linked lists as input and return their intersection
//
// I: two singly linked lists
// O: a list representing the intersection of the inputs
//
//  definition 'intersection':  given two lists, A and B, the intersection is the largest list that contains all the elements or objects that are common to both the set
//
//    - Note: a intersection is a set, and sets do not contain duplicates
//
//  Examples and test cases: (see tests below)
//
//  Data Structure: Set to store seen values
//
//  Algorithm 1: out-of-place
//  build Set from values of both lists; create/return new list from Set
//    (assumes no built-in `deleteAt` or `removeDuplicates` list methods)
//    
//    initiate list1Set & intersectionSet
//    traverse list1 and build set from its values
//    traverse list2 and for any value that is in both list1Set and list2, push to intersectionSet
//    build new list from intersectionSet
//    return new intersection list

// Algorithm 2: in-place:
// use hash/map to track values, prune list1 to become the intersection
//    (assumes no built-in `deleteAt` or `removeDuplicates` list methods)
//
//  initialize seen Map
//  iterate list1
//    add value to map if not seen
//    delete node if value seen
//  iterate list2
//    if value is in seen map, change maps value to 'intersection'
//  iterate list1
//    (prune list)
//    if value of current node in the map is 'intersection', keep node
//    else remove node
//  return list1
//

const Node = require('./Node.js');
const ListTools = require('./BuildList.js');
const listTool = new ListTools();
const buildList =  listTool.buildList;



// out-of-place algorithm
// SPACE: O(N) [actually 2N, where N is sum of list sizes, but constants removed]
// TIME: O(N) [actually 2N, where N is sum of list sizes, but constants removed]
const intersectionWithSet = (list1, list2) => {
  let list1Seen = new Set();
  let intersection = new Set();
  let current = list1.head.next;

  while (current !== null) {
    list1Seen.add(current.data);
    current = current.next;
  }

  current = list2.head.next;

  while (current !== null) {
    if (list1Seen.has(current.data)) intersection.add(current.data);
    current = current.next;
  }

  return buildList([...intersection]);
};


// SPACE: O(N) TIME: O(N) where N = combined lengths of lists
const intersection = (list1, list2) => {
  let seen = new Map();
  let current = list1.head.next;
  let previous = list1.head;

  while (current !== null) {
    if (seen.has(current.data)) {
      previous.next = current.next;
      current.next = null;
      current = previous.next;
    } else {
      seen.set(current.data, true); 
      previous = current;
      current = current.next;
    }
  }

  current = list2.head.next;

  while (current !== null) {
    if (seen.has(current.data)) seen.set(current.data, 'intersection');
    current = current.next;
  }

  current = list1.head.next;
  previous = list1.head;

  while (current !== null) {
    if (seen.get(current.data) !== 'intersection') {
      previous.next = current.next;
      current.next = null;
      current = previous.next;
    } else {
      previous = current;
      current = current.next;
    }
  }

  return list1;
};



// TESTS
const assert = require('assert').strict;

// setup data
const list1 = buildList([10,20,80,60]);
const list2 = buildList([15,20,30,60,45]);
const list3 = buildList([7,14,21,14,22,7]);
const list4 = buildList([1,2,2,2,3,4,7,5,6]);
const list5 = buildList([1,2,3]);
const list6 = buildList([3,1]);
const list7 = buildList([]);
const list8 = buildList([10]);
const list9 = buildList([15,20,14]);
const list10 = buildList([14,7,21]);
const list11 = buildList([]);
const list12 = buildList([]);
//
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
compareListValues(intersectionWithSet(list1, list2), [20,60]);
compareListValues(intersectionWithSet(list3, list4), [7]);
compareListValues(intersectionWithSet(list5, list6), [1,3]);
compareListValues(intersectionWithSet(list7, list8), []);
compareListValues(intersectionWithSet(list9, list10), [14]);
compareListValues(intersectionWithSet(list11, list12), []);

compareListValues(intersection(list1, list2), [20,60]);
compareListValues(intersection(list3, list4), [7]);
compareListValues(intersection(list5, list6), [1,3]);
compareListValues(intersection(list7, list8), []);
compareListValues(intersection(list9, list10), [14]);
compareListValues(intersection(list11, list12), []);

console.log('Tests green!');
