// 5. [Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)
//
//
//Problem Statement:
//Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

// Example 1:

// Input: "babad"
// Output: "bab"
// Note: "aba" is also a valid answer.

// Example 2:

// Input: "cbbd"
// Output: "bb"


// examples learned through probing individual tests:
// in: "" out: ""
// in: "a" out: "a"
// in: "ab" out: "ab"
//
// algo: modify existing function that counts palindromic substrings to instead keep a count of longest palindromic substring length
//
//
// Solution timed out, but did pass initial tests and the one it timed out on when run in isolation
const longestPalindrome = (str) => {
  const length = str.length;
  if (length < 2) return str;
  let longest = str[0];

  for (let foot = 0; foot < length - 1; foot++) {
    for (let head = foot + 1; head < length; head++) {
      let left = foot;
      let right = head;
      while (left < right) {
        if (str[left] !== str[right]) break;
        left++;
        right--;
        if (left >= right) {
          longest = (head - foot) + 1 >= longest.length ? str.slice(foot, head + 1) : longest;
          break;
        }
      }
    }
  }

  return longest;
};
