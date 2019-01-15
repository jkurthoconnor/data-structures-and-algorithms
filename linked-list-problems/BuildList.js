const Node = require('./Node.js');
const LinkedList = require('./LinkedList.js');

class ListTools {
  buildList(values) {
    const list = new LinkedList();

    let current = list.head;

    for (let data of values) {
      current.next = new Node(data);
      current = current.next;
    }

    return list;
  }
}

module.exports = ListTools;
