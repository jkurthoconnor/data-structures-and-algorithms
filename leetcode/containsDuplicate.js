 // 217. [Contains Duplicate](https://leetcode.com/problems/contains-duplicate/)

 // Problem Statement:

 //   Given an array of integers, return true if any value appears at least twice in the array, and return false if every element is distinct.

 //   Example 1:
 //     in: [1,2,3,1]
 //     out: true

 //   Example 2:
 //     in: [1,2,3,4]
 //     out: false

 //   Example 3:
 //     in: [1,1,1,3,3,4,3,2,4,2]
 //     out: true

 //   Additional Example;
 //     in: []
 //     out: false

 //  algorithm with memoization: O(N)
 //     create empty cache
 //     loop over array
 //       if cache[ array[idx] ] return true
 //       cache[array[idx]] = true
 //     return false if 

const containsDuplicate = (nums) => {
  const seen = new Object();

  for (let i = 0; i < nums.length; i++) {
    let n = nums[i];
    if (seen[n]) return true;
    seen[n] = true;
  }

  return false;
};
