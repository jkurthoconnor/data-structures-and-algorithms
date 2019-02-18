// Problem Statement:
//  implement a isBalanced() function which takes a string containing only curly, swuare and round parenthesis. The function will tell us whether all the parentheses in the string are balanced or not
//
//  Clarificarion:
//    to be balanced, a series of parenthesis must:
//      - have equal number of opening and closing parenthesis (of each type)
//      - the opening of a pair must occur before the closing
//      - 
//  In: a string of `(`, `)`, `{`, `}`, `[`, `]`; arranged in any order, and
//      of any length
//  Out: a boolean expressing whether the parens are balanced in the input
//
//   Examples and Test Cases:
//    (see tests below)
//
//  Data Structure:
//    a stack to hold remaining open parens
//
//  Algorithm:
 //     init empty stack to hold open parens in (reverse) order
//      init obj correlating open chars with closed 
//
//     iterate through input string
//        if char matches open pattern push char onto stack
//        else 
//          last open = stack.pop
//          if last open isn't matched by appropriate closing patten in char
//            return false
//
//      if stack is empty, return true, else return false
//  



// TIME: O(N), SPACE: O(N)
const Stack = require('./Stack.js');
const assert = require('assert').strict;

const isBalanced = str => {
  const currentlyOpen = new Stack();
  const pairs = {
    '(': ')',
    '[': ']',
    '{': '}',
  };

  for (const char of str) {
    if (pairs[char] !== undefined) {
      currentlyOpen.push(char);
    } else {
      let lastOpened = currentlyOpen.pop();

      if (pairs[lastOpened] !== char) {
        return false;
      }
    }
  }

  if (currentlyOpen.isEmpty()) {
    return true;
  } else {
    return false;
  }
};


// TESTS

process.stdout.write('Running Tests...');

assert.ok(isBalanced('{}'));
assert.ok(isBalanced('()'));
assert.ok(isBalanced('[]'));
assert.ok(isBalanced('[](){(())}'));
assert.ok(isBalanced('((((((()))))))'));
assert.ok(isBalanced('{}()[][]()[]{}'));

assert.ok(!isBalanced('{'));
assert.ok(!isBalanced('}'));
assert.ok(!isBalanced('[}'));
assert.ok(!isBalanced('[]({(())}'));
assert.ok(!isBalanced('(((((()))))))'));
assert.ok(!isBalanced('{}()[]]()[]{}'));

process.stdout.write('...Tests Green');
