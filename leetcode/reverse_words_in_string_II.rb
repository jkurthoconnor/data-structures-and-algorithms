# May 17 2019. Problem A: Given an input string, reverse the string word by word. Assume the input doesn't contain leading or trailing spaces and the words are always separated by a single space. Can you do it in O(N) time and O(1) space ? Input: "the sky is blue" Output: "blue is sky the
#
#  IN: str
#       words separated by single space
#       no leading / trailing spaces
#
# OUT: str: words, not chars are reversed
#           same string / mutate ideal
#
#  SPACE: O(N)
#  return_str = ""
#  iterate input in reverse
#   push each word on end of result
#
#
# front: anchor at word start:         anch - runner 
#        runner to find first space
#
# back:  anchor at word end             runner - anchor 
#        runner decriment to first space
#  
#
# 

# TIME: O(N) SPACE: O(1)
def reverse_words(str)
  reverse!(str, 0, str.length - 1)

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
