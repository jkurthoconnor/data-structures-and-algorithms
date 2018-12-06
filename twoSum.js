// 1. [Two Sum](https://leetcode.com/problems/two-sum/)


// Problem Statement:
// Given an array of integers, return indices of the two numbers such that they add up to a specific target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.

// Example:
// Given nums = [2, 7, 11, 15], target = 9,

// Because nums[0] + nums[1] = 2 + 7 = 9,
// return [0, 1].

// algorithms: 
// 1:  brute force / naive: O(N^2)
//     nested loops: outer advances through array, inner runs ahead and performs calculations
//       return value of outer and inner idx once the target value is the sum


// 2: memoization: O(N)

//   iterate through numbers
//     let diff = target - n
//     if (cache[difference] !== undefined) return [cache[diff], idx]
//     else cache[n] = idx

// ACCEPTED SOLUTIONS

// with memoization, O(N) time:

const twoSum = (nums, target) => {
  cache = {};

  for (let i = 0; i < nums.length; i++) {
    let diff = target - nums[i];
    if (cache[diff] !== undefined) return [cache[diff], i];
    cache[nums[i]] = i;
  }
};

// const twoSum = (nums, target) => {

//   for (let i = 0; i < nums.length; i++) {
//     let diff = target - nums[i];
//     let location = nums.indexOf(diff);
//     if (location >= 0 && location !== i) return [i, location];
//   }
// };

console.log(twoSum([2,7,11,15], 9));
console.log(twoSum([2,7,11,15], 22));
console.log(twoSum([2,7,11,15], 26));

