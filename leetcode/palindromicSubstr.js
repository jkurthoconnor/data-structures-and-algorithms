 // 647. [Palindromic Substrings](https://leetcode.com/problems/palindromic-substrings/)

 // Problem Statement:
 // Given a string, your task is to count how many palindromic substrings in this string.

 // The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.

// Example 1:

// Input: "abc"
// Output: 3
// Explanation: Three palindromic strings: "a", "b", "c".

// Example 2:

// Input: "aaa"
// Output: 6
// Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".

// Note:

// #   The input string length won't exceed 1000.
// #

 // PEDAC
 // in: string
 // out: int, count of palindromic substrings
 //           def: palindromic substrings: 
 //             1. a string consisiting of all or part of the input string, fo
 //             2. that reads the same forward and backward
 //               - each individual char counts as palindromic;
 //               - palindromes may overlap: diff start or stop idx distinguishes a substring from another
 //               - empty string is not palindromic (per testing)
 //               - the whole string may count as its own substring

 // naive algo: nested loops,
 //   initialize `count` to string length

 //   initialize `foot`0 and `head`0 pointers
 //   while `foot` < length - 1
 //     head = foot + 1
 //     while `head` < length
 // #     if str[foot..head] == str[head..foot], count += 1
       // head += 1
     // end
     // foot +=1
    // end


// Time Limit Exceeded, but does pass tests run individually

// const countSubstrings = (str) => {
//   const length = str.length;
//   let count = length;

//   for (let foot = 0; foot < length - 1; foot++) {
//     for (let head = foot + 1; head < length; head++) {
//       let sub = str.slice(foot, head + 1);
//       if (sub === sub.split('').reverse().join('')) {
//         count += 1;
//       }
//     }
//   }

//   return count;
// };


// ACCEPTED SOLUTION:
const countSubstrings = (str) => {
  const length = str.length;
  let count = length;

  for (let foot = 0; foot < length - 1; foot++) {
    for (let head = foot + 1; head < length; head++) {
      let left = foot;
      let right = head;
      while (left < right) {
        if (str[left] !== str[right]) break;
        left++;
        right--;
        if (left >= right) count += 1;
      }
    }
  }

  return count;
};
