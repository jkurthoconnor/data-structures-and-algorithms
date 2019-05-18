# LeetCode 557. Reverse Words in String III
#  IN: str
#       words separated by single space
#       no leading / trailing spaces
#
# OUT: str: chars in each word are reversed, word order remains the same
#           same string / mutate ideal
#
#  SPACE: O(N)
#  return_str = ""
#  iterate input in reverse
#   push each word on end of result
#
#

# TIME: O(N) SPACE: O(1)
def reverse_words(str)
  low = 0
  high = 0

  while high < str.length
    if str[high] == " "
      reverse!(str, low, high - 1)
      low = high + 1
    elsif high == str.length - 1
      reverse!(str, low, high)
    end

    high += 1
  end

  str
end

def reverse!(collection, low, high)
  while low < high
    tmp = collection[low]
    collection[low] = collection[high]
    collection[high] = tmp
    low += 1
    high -= 1
  end

  collection
end


p reverse_words("hello there")
p reverse_words("hello there Mr. Bill.")
p reverse_words("Let's take LeetCode contest")
