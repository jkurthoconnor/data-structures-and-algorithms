// Write a reverse function that takes a linked list and produces the opposite list
//
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

// algorithm #2: in-place
//    Space: O(1)
//    Time: O(N)
//
// key observations:
//  - rotated node will always be attached to front of list (i.e. as `head.next`)
//  - the original `head.next` moves toward the tail with each rotation
//  - the currently rotating node is always the next node past the original `head.next`
//  - the original head next is reattached the the tail at `current.next`
//
// algorithm:
//  save head as a constant
//  save tailAttachment as constant, initialze to `head.next`
//  save headAttachment as var, initialize to `head.next`
//  save current as var, initialize to `tailAttachment.next`
//  save nextNode as var, initialize to `current.next`
//
// traverse list
//  attach current as head.next
//  current.next = headAttachment
//  tailAttachment.next = nextNode
//
//  headAttachment = head.next
//  current = nextNode
//  nextNode = current.next
//
//
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
