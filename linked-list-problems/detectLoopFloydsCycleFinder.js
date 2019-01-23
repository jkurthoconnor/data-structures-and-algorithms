//By definition, a loop is formed when a node in the linked list points to a previously traversed node.

//Implement a detectLoop function which will take a linked list as input and deduce whether or not a loop is present

// PEDAC
//  I: singly linked list
//  O: true if input list contains a loop; false if input does not contain a loop
// 
// Algorithm: Floyd's Cycle Finding Algorithm
//  basic idea: if there is a loop in the list, and two runners traverse the list at 1x and 2x rates, eventually the runners will be on the same node
//  if there is no loop, then the runners will run to the end (i.e. next is null) without landing on the same node
//
//  set two runners to point at head.next
//
//  iterate the list: 
//    runnerOne = runnerOne.next
//    runnerTwo = runnerTwo.next.next
//    return true if runnerOne === runnerTwo
//
//
//  return false
// 
// TIME: O(N)
// SPACE: O(1)

const Node = require('./Node.js');
const ListTools = require('./BuildList.js');
const listTool = new ListTools();
const buildList =  listTool.buildList;

const detectLoop = list => {
  let slowRunner = list.head;
  let fastRunner = list.head;

  while (slowRunner && fastRunner && fastRunner.next) {
    slowRunner = slowRunner.next;
    fastRunner = fastRunner.next.next;

    if (slowRunner === fastRunner) return true;
  }

  return false;
};

// TESTS
const assert = require('assert').strict;
const loopedList1 = buildList([1,2,3,4,5])
loopedList1.head.next._next = loopedList1.head.next;  // uses property `_next` to
                                                    //avoid loop guard built into
                                                    //the setter `next`
const list = buildList([1,2,3,4,4,5,4]);

assert(!detectLoop(list));
assert(detectLoop(loopedList1));






