class Node {
  constructor(d, n=null) {
    this._data = d;
    this._next = n;
  }

  get data() {
    return this._data;
  }

  set data(v) {
    this._data = v;
  }

  get next() {
    return this._next;
  }

  set next(n) {
    if ( (n === null) || ((n instanceof Node) && (n != this)) ) {
      this._next = n;
    } else {
      throw new Error('Next must be a Node and not the receiver');
    }
  }
}

module.exports = Node;
