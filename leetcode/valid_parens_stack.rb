=begin
 LeetCode 20. Valid Parentheses

PROBLEM:
Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

    Open brackets must be closed by the same type of brackets.
    Open brackets must be closed in the correct order.

Note that an empty string is also considered valid.

Example 1:

Input: "()"
Output: true

Example 2:

Input: "()[]{}"
Output: true

Example 3:

Input: "(]"
Output: false

Example 4:

Input: "([)]"
Output: false

Example 5:

Input: "{[]}"
Output: true


IN: string of only three parens types
OUT: bool representing if input has valid arrangement of parens

RULES:
  every open parens must be closed by its complement (i.e., its closing partner)

  parens must be closed in the reverse order of opening: 
    - e.g. '[((]' is invalid because the first closing attempt, the ']', closes 
      the '(', and the two are not compliments

    - LESSON: *** Last Opened must be First Closed ***

MODEL:
  Because the core problem is one of matching _ordered_ openings and closings,
  and Last Opened must be First Closed, this problem can be approached with a 
  stack

ALGORITHM:
  iterate through input string
    if current char is an opening parens push it to the stack
    else pop last opened from stack, & if the current char and last opened
      are not compliments, return false

  after checking all chars in the string above, return:

    stack.empty?


=end

# TIME: O(N) SPACE: O(N)
require_relative "../stack_linked_list"

def is_valid?(str)
  closing_for = { "(" => ")", "[" => "]", "{" => "}" }

  open_parens = Stack.new
  i = 0

  while i < str.length
    char = str[i]

    if char.match?(/[\(\[\{]/)
      open_parens.push(char)
    else
      opening = open_parens.pop
      if char != closing_for[opening]
        return false
      end
    end

    i += 1
  end

  open_parens.size == 0
end

p is_valid?("()")       # t
p is_valid?("()[]{}")   # t
p is_valid?("{[]}")     # t

p is_valid?("(]")       # f
p is_valid?("([)]")     # f
p is_valid?("]")        # f



=begin
The following version, with a stack structure replaced with simple array, 
passed in LeetCode: TIME: faster than 99%; SPACE: less memory than 100%

def is_valid(str)
  closing_for = { "(" => ")", "[" => "]", "{" => "}" }

  open_parens = []
  i = 0

  while i < str.length
    char = str[i]

    if char.match?(/[\(\[\{]/)
      open_parens.push(char)
    else
      opening = open_parens.pop
      if char != closing_for[opening]
        return false
      end
    end

    i += 1
  end

  open_parens.empty?
end
=end
