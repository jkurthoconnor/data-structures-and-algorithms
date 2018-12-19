/* 7. [Reverse Integer](https://leetcode.com/problems/reverse-integer/) */

/* Given a 32-bit signed integer, reverse digits of an integer. */

/* Example 1: */

/* Input: 123 */
/* Output: 321 */

/* Example 2: */

/* Input: -123 */
/* Output: -321 */

/* Example 3: */

/* Input: 120 */
/* Output: 21 */

/* Note: */
/* Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows. */

/* PEDAC */
/* in: int */
/* out: int, reversed input, same sign as input, unless range exceeded */
/*   implied rules: leading zero is dropped (as expected from an integer) */
/*                  tests show '+' sign is dropped on output */


// algo:
//   set var for sign factor: 1 or -1
//   set absInt var
//   set revInt var to 0

// peel off place values (digits) and build reversed digit int
//   loop until absInt is 0
//     pop = absInt % 10
//     absInt = Math.floor(absInt / 10)
//     revInt = revInt * 10 + pop 
//     guard: if revInt exceeds 32bit signed range, return 0

// return revInt * sign factor

// ACCEPTED SOLUTION
const reverse = (int) => {
  const overflowPoint = Math.pow(2,31);

  if (Math.abs(int) < 10) {
    return int;
  }

  let signFactor = 1;
  if (int < 0) {
    signFactor = -1;
  }

  let absInt = Math.abs(int);
  let revInt = 0;

  while (absInt > 0) {
    let popped = absInt % 10;
    revInt = (revInt * 10) + popped;

    if ( (signFactor === 1 && (revInt >= overflowPoint - 1))
       || signFactor === -1 && (revInt >= overflowPoint) ) {
      return 0
    }

    absInt = Math.floor(absInt / 10);
  }

  return revInt * signFactor;
};


console.log(reverse(123));
console.log(reverse(321));
console.log(reverse(-123));
console.log(reverse(120));
console.log(reverse(0));

