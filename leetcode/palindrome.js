// 125. [Valid Palindrome](https://leetcode.com/problems/valid-palindrome/)
  
// Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

// Note: For the purpose of this problem, we define empty string as valid palindrome.

// Example 1:

// Input: "A man, a plan, a canal: Panama"
// Output: true

// Example 2:

// Input: "race a car"
// Output: false

// Naive solution using convenience methods:
//   remove spaces and normalize case; compare result with result reversed

// PASSES LOCAL and LEETCODE TESTS
// const isPalindrome = (str)  => {
//   str = str.toLowerCase().replace(/[^a-z0-9]/g, '');
//   return str === [...str].reverse().join('');
// };
//
// Two pointer solution:
//   set a pointer to each terminus, e.g. left and right
//   loop while left <= right
//     if left is not alphanum, advance left += 1 until points to alphanum
//     if right isnot alphanum, advance right += 1 until points to alphanum
//     compare left and right (case insensitive)
//       return false if left and right are not same char
//   return true 
// SOLUTION ACCEPTED

const isPalindrome = (str)  => {
  let left = 0;
  let right = str.length - 1;
  let pattern = RegExp('[^a-zA-Z0-9]');

  if (str.length === 1) return true;

  while (left < right) {
    if (pattern.test(str[left])) {
      while (true) {
        left += 1;
        if (!pattern.test(str[left])) break;
      }
    }
    if (pattern.test(str[right])) {
      while (true) {
        right -= 1;
        if (!pattern.test(str[right])) break;
      }
    }

    // necessary to allow, e.g. ",.", where both pointers run off the string
    // and return `undefined`; with no chars to compare, its tantamount to
    // an empty string
    if (str[left] === undefined && str[right] === undefined) break;
    if (str[right].toLowerCase() !== str[left].toLowerCase()) return false;
    left += 1;
    right -= 1;
  }

  return true;
};

module.exports = isPalindrome;

