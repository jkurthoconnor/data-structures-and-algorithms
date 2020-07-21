def sort_stack(nums)
  tmp = []

  while nums.any?
    curr = nums.pop

    if tmp.empty? || curr >= tmp[-1]
      tmp.push(curr)
    else
      while tmp.any?
        nums.push(tmp.pop)
      end
      tmp.push(curr)
    end
  end

  while tmp.any?
    nums.push(tmp.pop)
  end

  nums
end


p sort_stack([1,2,3,4])
p sort_stack([3,2,1,3])
