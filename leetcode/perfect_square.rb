# LeetCode 367. Valid Perfect Square
#
# PROBLEM:
# Given a positive integer num, write a function which returns True if num is a perfect square else False.

# Original, Naive Implementation: Use a literal number line to run binary search over
#
# TIME: O(N log N)
# def is_perfect_square(n)
#   low = 0
#   high = n / 3
#   series = (1..high).to_a

#   while low <= high
#     mid = low + (high - low) / 2

#     square = series[mid] * series[mid]
#     return true if square == n

#     (square < n) ? (low = mid + 1) : (high = mid - 1)
#   end

#   return false
# end



# TIME: O(log N) SPACE: O(1)
# LeetCode: faster than 98%; less memory than 100%
def is_perfect_square(n)
  return true if n == 1
  low = 0
  high = n / 2

  while low <= high
    mid = low + (high - low) / 2
    square = mid * mid
    return true if square == n

    (square < n) ? (low = mid + 1) : (high = mid - 1)
  end

  return false
end

p is_perfect_square(1) # T
p is_perfect_square(2) # F
p is_perfect_square(4) # T
p is_perfect_square(5) # F
p is_perfect_square(16) # T
p is_perfect_square(14) # F
p is_perfect_square(49) # T
p is_perfect_square(19) # F
p is_perfect_square(25) # T
p is_perfect_square(901) # F
p is_perfect_square(900) # T
p is_perfect_square(10001) # F
p is_perfect_square(10000) # T
p is_perfect_square(10004) # F

