// implement a length method that takes a linked list as an input and returns 
// its length (don't use a built-in `length` property

// Space: O(N)
// Time: O(N)

const Node = require('./Node.js');
const LinkedList = require('./LinkedList.js');
const ListTools = require('./BuildList.js');

const listTool = new ListTools();
const buildList =  listTool.buildList;

const length = (list) => {
  let count = 0;
  let current = list.head.next;

  while (current) {
    count += 1;
    current = current.next;
  }

  return count;
};




let list1 = buildList([0,1,2,3,4]);
let list2 = buildList([7,14,21]);
let list3 = buildList([]);
let list4 = buildList([0,1,2,3,4,5,6,7,8]);

console.log(length(list1));
console.log(length(list2));
console.log(length(list3));
console.log(length(list4));

