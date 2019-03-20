List = require('../linked-lists/LinkedList'); 

class Graph {
  constructor(v) {
    this.adjacencyList = [];
    this.vertices = v;

    for (let i = 0; i < v; i++) {
      this.adjacencyList.push(new List());
    }
  }

  addEdge(sourceIdx, destinationIdx) {
    this.adjacencyList[ sourceIdx ].insertAtTail(destinationIdx);
  }

  printGraph() {
    // TODO: implement directly w/o LinkedList.prototype.printList()
    this.adjacencyList.forEach((list, idx) => {
      process.stdout.write(`${idx} -> `);
      list.printList();
    });
  }
}


const testGraph = new Graph(4);
testGraph.addEdge(0, 1);
testGraph.addEdge(0, 2);
testGraph.addEdge(1, 3);
testGraph.addEdge(2, 3);

testGraph.printGraph();

