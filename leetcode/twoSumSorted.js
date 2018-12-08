// see Ruby solution for description and LeetCode link

const twoSumSorted = (nums, target) => {
  let [low, high] = [0, nums.length - 1];

  while (low < high) {
    let total = nums[low] + nums[high];

    if (total < target) {
      low ++;
    } else if (total > target) {
      high --;
    } else {
      return [low, high].map((n) => n + 1);
    }
  }
};
