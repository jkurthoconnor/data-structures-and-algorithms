def add_bitwise(x,y)
  while y > 0
    common = x & y      # shared bits
    uncommon = x ^ y    # unshared bits

    x = uncommon
    y = common << 1     # shared bits shift left
  end

  x
end

def subtract_bitwise(x,y)
  while y > 0
    to_subtract = (~x) & y
    uncommon = x ^ y
    x = uncommon
    y = to_subtract << 1
  end

  x
end

p subtract_bitwise(4,3)  # 1
p subtract_bitwise(8,3)  # 5
p subtract_bitwise(101,3)  # 98

p add_bitwise(10, 10)      # 20
p add_bitwise(101, 10)     # 111
p add_bitwise(141, 10)     # 151



