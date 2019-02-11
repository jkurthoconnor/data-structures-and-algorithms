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
//    '921*-8-4+'
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

const Stack = require('./Stack.js');

const evalPostFix = expression => {
  if (expression.match(/[^0-9+\-*\/]/)) return null;
  if (!expression.match(/^[0-9]{2}/)) return null;

  let [leftVal, rightVal, operator, prevChr] = [,,,];
  let digits = new Stack();

  for (let chr of expression) {
    if (chr.match(/[0-9]/)) {
      prevChr = true;
      digits.push(chr);
      continue;
    }

    operator = chr;
    prevChr = !prevChr;

    if (leftVal === undefined) {
        rightVal = digits.pop();
        leftVal = digits.pop();
    } else {
      if (prevChr) {
        rightVal = leftVal;
        leftVal = digits.pop();
      } else {
        rightVal = digits.pop();
      }
    }

    leftVal = evalInFix(leftVal, operator, rightVal);
  }

  return leftVal;
};

const evalInFix = (valLeft, op, valRight) => {
  switch (op) {
    case '+':
      return Number(valLeft) + Number(valRight);
    case '-':
      return Number(valLeft) - Number(valRight);
    case '*':
      return Number(valLeft) * Number(valRight);
    case '/':
      return Number(valLeft) / Number(valRight);
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
