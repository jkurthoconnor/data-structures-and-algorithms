#! /usr/bin/env ruby

=begin
Question 2 on RedRoute's 90 min online code challenges (3)

Given an array of integers a, return a new array b using the following guidelines:
For each index i in b, the value of bi is the index of the aj nearest to ai and is also greater than ai. If there are two options for bi, put the leftmost one in bi. If there are no options for bi, put -1 in bi. Example

For a = [1, 4, 2, 1, 7, 6], the output should be nearestGreater(a) = [1, 4, 1, 2, -1, 4].

for a[0], the nearest larger element is 4 at index a[1] -> b[0] contains the value 1. for a[1], the nearest larger element is 7 at a[4] -> b[1] contains the value 4. for a[2], the nearest larger element is 4 at a[1] (7 is also larger, but 4 has the minimal position) -> b[2] contains the value 1. for a[3], the nearest larger element is 2 at a[2] (7 is also larger, but 2 has the minimal position) -> b[3] contains the value 2. for a[4], there is no element larger than 7 -> b[4] contains the value -1. for a[5], the nearest larger element is 7 at a[4] -> b[5] contains the value 4. in: int arr (unsorted) no empty arr

########

out: arr where for each idx, the value in b at that idx is the idx of the nearest n in a that is greater than a[idx]

iterate a
  take value at a[idx]
  the value at b[idx] is:
    the nearest (in idx spots) idx in a with a value that is > than a[idx]
    if a tie, then take the lower idx
    if no val is > than a[idx], use -1
=end

# TIME: O(N^2)   ; SPACE: O(N)

def nearestGreater(a)
  b = []

  a.each_with_index do |n, idx|
    l_idx = idx -1
    r_idx = idx + 1
    l_diff = Float::INFINITY
    r_diff = Float::INFINITY

    while l_idx >= 0
      if a[l_idx] > n
        l_diff = idx - l_idx
        break
      end

      l_idx -= 1
    end

    while r_idx < a.size
     if a[r_idx] > n
       r_diff = r_idx - idx
       break
     end

      r_idx += 1
    end
    
    case l_diff <=> r_diff 
    when -1 then b << l_idx
    when 1 then  b << r_idx
    else         l_diff.infinite? ? b << -1 : b << l_idx
    end
  end

  b
end



p nearestGreater([2,1,9,7,6])  # [2,0,-1,2,3]
p nearestGreater([3,1,9,7,10])  # [2,0,4,2,-1]

