List = require('../linked-lists/LinkedList'); 

class Graph {
  constructor(v) {
    this.adjacencyList = [];
    this.vertices = v;

    for (let i = 0; i < v; i++) {
      this.adjacencyList.push(new List());
    }
  }
}


const testGraph = new Graph(3);
console.log(testGraph);



