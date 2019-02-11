// Problem Statement:
//   implement a function that evaluates a postfix expression given as a string

//   in: postfix math expression in string form; NB: numbers are single digit
//   out: integer representing the value of the input expression

// Clarification:
//   postfix expression: an expression in which the mathematical operators appear
//   after the two numbers involved in the expression

//   Test Cases:
//     (see below)
//
//  Algorithm #1  passed tests, but too complex tracking prevChar, left and right
//
//  '921*-8-4+'
//   pC:
//   s: 
//   o: 
//   l: 
//   r: 
//   
//    iterate through each char
//
//      push digits onto stack until come to operator  (if push set prevchr true)
//      save operator (set prevchar to !prevChar)
//      if left value is undefined
//        pop two digits off stack, save first as right, second as left
//      else pop one off stack, 
//          if prevOp, 
                  // save left as right, pop one digit off stack, new as left
// i        else save new as right
//      compute & save value of left operator right as left (cast left and right as integers
//    return left
//
// Algorithm #2: (implemented below)
//
// guard clauses for illegitimate expressions
// init empty stack
//
// iterate string/expression
//    push digit chars (as Numbers) onto stack
//    if char is operator
//      pop two off stack:
//        first is right; second is left
//        push evaluation of (left operator right) onto stack
//
//    return stack(pop)

const Stack = require('./Stack.js');

const evalPostFix = expression => {
  if (expression.match(/[^0-9+\-*\/]/)) return null;
  if (!expression.match(/^[0-9]{2}/)) return null;

  let digits = new Stack();

  for (let chr of expression) {
    if (chr.match(/[0-9]/)) {
      digits.push(Number(chr));
    } else {
      let operator = chr;
      let rightVal = digits.pop();
      let leftVal = digits.pop();

      digits.push(evalInFix(leftVal, operator, rightVal));
    }
  }

  return digits.pop();
};

const evalInFix = (valLeft, op, valRight) => {
  switch (op) {
    case '+':
      return valLeft + valRight;
    case '-':
      return valLeft - valRight;
    case '*':
      return valLeft * valRight;
    case '/':
      return valLeft / valRight;
  }
};

// TESTS
const assert = require('assert').strict;
process.stdout.write('Running Tests...');

assert.equal(evalPostFix('2'), null);
assert.equal(evalPostFix('12i2+'), null);
assert.equal(evalPostFix('1ai2+'), null);
assert.equal(evalPostFix('12+'), 3);
assert.equal(evalPostFix('638*+4-'), 26);
assert.equal(evalPostFix('921*-8-4+'), 3);

process.stdout.write('...Tests Green');
