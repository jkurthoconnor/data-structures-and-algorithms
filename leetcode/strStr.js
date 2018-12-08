// 28. [Implement strStr()](https://leetcode.com/problems/implement-strstr/)


// Problem statement:
// return idx of first occurence of a needle in haystack, or -1 if needle is not part of haystack

// Case 1: 
//   in: haystack = "hello"; needle = "ll"
//   out: 2

// Case 2:
//   in: haystack = "aaaaa", needle = "bba"
//   out: -1
//
// algorithm:
//   iterate chars until find match with first needle char
//     send out runner (inner loop) 
//       & check if idx + 1... matches needle  
//         if no match, break into outer loop
//         if idx is last of needle, return i
//  return -1 if exit outer loop
//

// ACCEPTED SOLUTIONS:
//
// const strStr = (haystack, needle) => {
//  return haystack.indexOf(needle);
// };
//
// const strStr = (haystack, needle) => {
//   const result = haystack.match(new RegExp(needle));
//   return (result == null) ? -1 : result.index;
// };


// result accepted, but slower than both of my solutions above:
const strStr = (haystack, needle) => {
  if (needle === '' || needle === haystack) return 0;

  const [firstNeedle, stackEnd, needleEnd] = [needle[0], haystack.length - needle.length, needle.length];

  for (let i = 0; i <= stackEnd; i++) {
    if (haystack[i] === firstNeedle) {
      for (let j = 0; j < needleEnd; j++) {
        if (haystack[i + j] !== needle[j])  break;
        if (j === needleEnd - 1) return i;
      }
    }
  }
  return -1;
};
