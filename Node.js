class Node {
  constructor(v, n=null) {
    this.val = v;
    this.nxt = n;
  }

  get value() {
    return this.val;
  }

  set value(v) {
    this.val = v;
  }

  get next() {
    return this.nxt;
  }

  set next(n) {
    if (n instanceof Node) {
      this.nxt = n;
    } else {
      throw new Error('Next must be a Node');
    }
  }
}

module.exports = Node;
