// Write a reverse function that takes a linked list and produces the opposite list
//  algorithm #1: return new list: 
  //  Space: O(N)
  //  Time: O(N)
//
//   create new list and save reference as list
//   create new node, save as previousCopy
//   iterate list
//      create new node from data of iterated node and save as previousCopy
//      current = current.next
//
//   algorithm #2: in-place
//    Space: O(1)
//    Time: O(N)
//
//   save head
//   save reference to head.next as connectTo
//
//   iterate list while current.next
//
//
//
//
const Node = require('./Node.js');
const LinkedList = require('./LinkedList.js');
const ListTools = require('./BuildList.js');
const listTool = new ListTools();
const buildList =  listTool.buildList;

const reverse = (list) => {
  const reversedList = new LinkedList();
  let originalNode = list.head.next;
  let copyNode = new Node(originalNode.data);

  while (originalNode.next) {
    originalNode = originalNode.next;
    copyNode = new Node(originalNode.data, copyNode);
  }

  reversedList.head.next = copyNode;
  return reversedList;
};

const reverseInPlace = (list) => {
  const head = list.head;
  const connectTail = head.next;
  let current = connectTail.next;
  let n = current.next;

  while (true) {
    current.next = head.next;
    head.next = current;
    connectTail.next = n;

    if (!connectTail.next) break;
    current = n;
    n = current.next;
  }
};

let list1 = listTool.buildList([0,1,2,3,4]);
let list2 = listTool.buildList([0,9,11,34,48]);

let rev1 = reverse(list1);
let rev2 = reverse(list2);
rev1.printList();
rev2.printList();

reverseInPlace(list1);
reverseInPlace(list2);
list1.printList();
list2.printList();
