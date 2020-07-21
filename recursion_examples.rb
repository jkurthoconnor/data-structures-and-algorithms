#! /usr/bin/env ruby

=begin
Recursion Examples
=end

def palindrome?(word)
  return ends_match?(word, 0, word.size - 1)
end

def ends_match?(word, left, right)
  return true if left >= right
  return false if word[left] != word[right]

  ends_match?(word, left + 1, right - 1)
end

def binary_search(arr, left, right, target)
  return -1 if left > right
  mid = (right + left) / 2

  if arr[mid] == target
    return mid
  elsif arr[mid] > target
    return binary_search(arr, left, mid - 1, target)
  else
    return binary_search(arr, mid + 1, right, target)
  end
end

def traverse_directories(directory)
  Dir.foreach(directory) do |file|
    if file != "." && file != ".."
      puts "#{file}"

      if File.directory?("#{directory}/#{file}")
        traverse_directories("#{directory}/#{file}")
      end

    end
  end
end

def countdown(n)
  return if n < 0
  n == 0 ? (p "blast off") : (p n)
  countdown(n - 1)
end

def fib(n)
  return 0 if n == 1
  return 1 if n == 2

  fib(n - 1) + fib(n - 2)
end

def fib_with_memo(n, seen={})
  return 0 if n == 1
  return 1 if n == 2

  seen[n - 1] = seen[n - 1] || fib_with_memo(n - 1, seen) 
  seen[n - 2] = seen[n - 2] || fib_with_memo(n - 2, seen)

  seen[n - 1] + seen[n - 2]
end


def sum_up_to(num)
  return 1 if num == 1
  sum_up_to(num - 1) + num
end

def factorial(num)
  return 1 if num == 1
  factorial(num - 1) * num
end


def factorial_iterative(num)
  fac = 1
  (1..num).each { |n| fac *= n }
  fac
end

# n = 12
# p sum_up_to(n) == (1..n).reduce(:+)
# p factorial(n) == factorial_iterative(n)

# p fib(1)
# p fib(2)
# p fib(3)
# p fib(4)
# p fib(5)
# p fib(6)
# p fib(7)


# p fib_with_memo(1)
# p fib_with_memo(2)
# p fib_with_memo(3)
# p fib_with_memo(4)
# p fib_with_memo(5)
# p fib_with_memo(6)
# p fib_with_memo(7)
#

# countdown(12)
#
# traverse_directories("/home/jko/code/crato-logging")
#
# a = [2,4,5,6,9,12,123, 900]

# p binary_search(a, 0, a.size - 1, 12)
# p binary_search(a, 0, a.size - 1, 19)
                     
p palindrome?('hello')
p palindrome?('lol')

