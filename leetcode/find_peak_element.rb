# LeetCode 162. Find Peak Element
#
# PROBLEM:
# A peak element is an element that is greater than its neighbors.

# Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.

# The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.

# You may imagine that nums[-1] = nums[n] = -∞.

# Note:

# Your solution should be in logarithmic complexity.
#
# MODEL: 
#      binary search with O(1) comparison of adjacent values
          # if at a peak, return idx
          # if on a slope (i.e. !peak, since no adjacent indices have same values)
          #   move 'uphill'
          #       (when in a valley, either uphill side will do)

#
#         Peak:  value at idx -1 < value at idx > value at idx +1
#
#         Left Rising Slope: value at idx -1 > value at idx 
#             search left
#
#         Right Rising Slope: value at idx +1 > value at idx
#             search right


# TIME: O(log N) SPACE: O(1)
# LeetCode: faster than 99%; less memory than 100%
def find_peak_element(nums)
  return 0 if nums.length == 1

  low = 0
  high = nums.length - 1

  while low <= high
    mid = low + (high - low) / 2

    return mid if is_peak?(nums, mid)

    if on_left_slope?(nums, mid)
      high = mid  - 1
    else
      low = mid + 1
    end
  end

end

def is_peak?(nums, idx)
  max = nums.length - 1
  val = nums[idx]

  (idx == 0 && (nums[idx + 1] < val)) ||
    (idx == max && (val > nums[idx - 1])) ||
    (val > nums[idx + 1] && (val > nums[idx - 1])) # trouble with idx==0
end                                                # not triggered with idx==0
                                                   # because 1st clause catches

def on_left_slope?(nums, idx)
  idx != 0 && (nums[idx - 1] > nums[idx])
end



p find_peak_element([1])             # 0
p find_peak_element([1,2])           # 1
p find_peak_element([1,2,3,1])       # 2
p find_peak_element([1,2,1,3,5,6,4]) # 1 or 5
p find_peak_element([1,0,1,3,5,6,4]) # 0 or 5
p find_peak_element([5,4,3,2,1])     # 0
p find_peak_element([0,1,9,5,4,2])   # 2
p find_peak_element([1,2,3,5,6,7])   # 5

