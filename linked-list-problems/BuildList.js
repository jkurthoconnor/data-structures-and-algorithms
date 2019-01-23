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

module.exports = ListTools;
