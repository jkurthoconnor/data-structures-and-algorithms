=begin
LeetCode 55. Jump Game

PROBLEM:
Given an array of non-negative integers, you are initially positioned at the first index of the array.

Each element in the array represents your maximum jump length at that position.

Determine if you are able to reach the last index.

Example 1:
Input: [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.

Example 2:
Input: [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what. Its maximum
             jump length is 0, which makes it impossible to reach the last index.

IN: int array of values representing max jumps
OUT: boolean; 

RULES
  - goal is to jump from idx0 to the final spot in accordance with the 'jump value'
      - jump value: each element represents number of possible index spaces 'player'
      may jump from that spot

  - the accessibility of one element (A) from another (B) is expressed by the relationship between the difference in index values and the value held in A

      *** A may access B iff idxB - idxA >= array[A] ***

  RECURSIVE STRUCTURE:
    - a target element (T) is accessible from the array start  by an element (E) 
      if the value of E is >= idxT - idxE && E is itself accessible from the array
      start

=end

def can_jump(nums)
  accessible?(nums, nums.length - 1)
end

def accessible?(nums, to_idx, memo = {})
  return true if to_idx == 0 

  idx = 0
  while idx < to_idx
    jumps_needed = to_idx - idx

    if nums[idx] >= jumps_needed && accessible?(nums, idx) 
      return true 
    end

    idx += 1
  end

  false
end

p can_jump([2,3,1,1,4])                 # true
p can_jump([8,0,0,0,0,0,0,0,4])         # true
p can_jump([1])                         # true
p can_jump([7,0,0,0,0,0,0,0,4])         # false
p can_jump([3,2,1,0,4])                 # false
p can_jump([1,0,14,3,2])                # false
