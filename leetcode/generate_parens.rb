=begin
LeetCode 22. Generate Parentheses

PROBLEM:
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

For example, given n = 3, a solution set is:

[
  "((()))",
  "(()())",
  "(())()",
  "()(())",
  "()()()"
]


MODEL:
  treat as a permutations problem like any other
    create an array of n / 2 open parens and n / 2 closed parend
    generate every possible permutation of of the chars
    filter / contrain in the the base case to push only those that are uniq and that pass a parens validator
=end


def generate_parenthesis(n)
  result = []
  source = SyntaxTools::create_parens_pairs(n)
  helper(source, result)
  result
end

def helper(source, result, tmp=[], idx=0)
  puts "#{source}, #{result}, tmp=#{tmp}, idx=#{idx}"
  if tmp.size == source.size && (tmp.join.valid_parens?)
    result.push(tmp.join)  # all legit results as tmp are being pushed
    
  else
    i = idx

    while i < source.size   # once tmp hits full size 1x, it never reaches size again
      tmp.push(source[i])
      helper(source, result, tmp, i + 1)
      tmp.pop
      i += 1
    end
  end
end

module SyntaxTools
  PAIRS = {
    "(" => ")",
    "[" => "]",
    "{" => "}"
  }

  def self.create_parens_pairs(n)
    Array.new(n, '(') + Array.new(n, ')')
  end

  def valid_parens?
    openings = []

    each_char do |p|
      if p.opener?
        openings.push(p)
      elsif p.closer?
        open = openings.pop
        return false unless open && open.closed_by?(p)
      end
    end

    openings.empty?
  end

  protected
  def opener?
    match?(/^[\(\[\{]$/)
  end

  def closer?
    match?(/^[\)\]\}]$/)
  end

  def closed_by?(char)
    PAIRS[self] == char  
  end
end

class String
  include SyntaxTools
end


# p generate_parenthesis(3)
p generate_parenthesis(2)


