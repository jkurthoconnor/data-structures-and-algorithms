const Node = require('./Node.js');
const LinkedList = require('./LinkedList.js');

class ListTools {
  buildList(values) {
    const list = new LinkedList();

    for (let data of values) {
      list.insertAtTail(data);
    }

    return list;
  }
}

const tools = new ListTools();
const list1 = tools.buildList([1,2,3,4]);
list1.printList();
console.log(list1.length);
list1.deleteAtTail();
list1.printList();
console.log(list1.length);

module.exports = ListTools;
