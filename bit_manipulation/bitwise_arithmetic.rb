def add_bitwise(x,y)
  while y > 0               # while there are values to carry forward
    carry_bits = x & y      # id bits with place-value overflow; mark 1 (else 0)
    x = x ^ y               # x = bits with place-appropriate values;
    y = carry_bits << 1     # carry bits shift left to next place value
                           # assuring x + y = sum equation
  end
  x
end

def subtract_bitwise(x,y)
  while y > 0
    borrowers = (~x) & y    # id bits that need to borrow from next higher place
    x  = x ^ y              #
    y = borrowers << 1
  end

  x
end

p subtract_bitwise(4,3)  # 1
p subtract_bitwise(8,3)  # 5
p subtract_bitwise(101,3)  # 98

p add_bitwise(10, 10)      # 20
p add_bitwise(101, 10)     # 111
p add_bitwise(141, 10)     # 151



