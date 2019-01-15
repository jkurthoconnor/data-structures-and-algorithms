const Node = require('./Node.js');
// unlike when simply building a list from nodes & keeping track of the head
// node, this class has a dedicated head which always points to the first node

class LinkedList {
  constructor() {
    this._head = new Node(-1);
    this.length = 0;
  }

  get head() {
    return this._head;
  }

  isEmpty() {
    return this.length === 0;
  }

  insertAt(n, data) {
    if (n < 0 || n > this.length) {
      throw new Error('Index is outside of list range.');
    }

    let prevNode = this.head;
    let currentNode = prevNode.next;
    let node = new Node(data);
    let idx = 0;

    while (idx < n) {
      prevNode = currentNode;
      currentNode = currentNode.next;
      idx += 1;
    }

    prevNode.next = node;
    node.next = currentNode;
    this.length += 1;

    return this;
  }

  insertAtHead(data) {
    this.insertAt(0, data);
  }

  insertAtTail(data) {
    this.insertAt(this.length, data);
  }

  deleteAt(n) {
    if (n >= this.length || n < 0) {
      throw new Error('Index is outside of allowed range.');
    }

    let prevNode = this.head;
    let currentNode = this.head.next;
    let idx = 0;

    while (idx < n) {
      prevNode = currentNode;
      currentNode = currentNode.next;
      idx += 1;
    }

    prevNode.next = currentNode.next;
    currentNode.next = null; 

    return this;
  }

  deleteAtHead() {
    this.deleteAt(0);
  }

  deleteValue(value) {
    const target = this.searchFor(value);

    if (target !== -1) {
      this.deleteAt(target);
    } else {
      return -1;
    }
  }

  searchFor(dataValue) {
    let currentNode = this.head.next;
    let idx = 0;

    while (currentNode) {
      if (currentNode.data === dataValue) return idx;

      currentNode = currentNode.next;
      idx += 1;
    }

    return -1;
  }
 
  printList() {
    let currentNode = this.head.next;

    while (currentNode) {
      process.stdout.write(`${currentNode.data} -> `);
      currentNode = currentNode.next;
    }

    console.log(currentNode);
  }
}


// let firstList = new LinkedList();
// console.log(firstList);
// console.log(firstList.head);
// console.log(firstList.isEmpty());
// firstList.insertAtTail(1);
// firstList.insertAtTail(2);
// console.log('Printing firstList:');
// firstList.printList();
// firstList.deleteAtHead();
// console.log('Printing firstList after deletion at head:');
// firstList.printList();


// let secondList = new LinkedList();
// secondList.insertAtHead(2);
// secondList.insertAtHead(1);
// secondList.insertAtTail(10);
// secondList.insertAt(3, 11);
// // secondList.insertAt(-2, 11);  // throws error as intended
// // secondList.insertAt(21, 11);  // throws error  as intended
// secondList.insertAt(2, 9);
// secondList.insertAtTail(12);
// console.log('Printing secondList:');
// secondList.printList();
// console.log(secondList.searchFor(9));
// console.log(secondList.searchFor(2));
// console.log(secondList.searchFor(97));
// secondList.deleteAt(3);
// console.log('Printing second list after removing value at idx 3');
// secondList.printList();
// secondList.deleteValue(9);
// console.log('Printing second list after removing value 9');
// secondList.printList();
// secondList.deleteValue(97);
// console.log('Printing second list after attempting to remove non-existant value');
// secondList.printList();

module.exports = LinkedList;
