=begin
Logical Relations:
  a) `x & 1` will always and only return 1 when x is 1
  b) `x & 0` will always return 0

Masking:
  - from a), setting a mask with 1 at the target bit and applying `&` will
    return 1 when the bit is set

  - from b), setting a mask with 0s at all non-target bits and applying `&`
    will zero out all other returned values

Thus, masking as above will return a non-zero value only when the target bit is
  set.
=end

def is_bit_set?(bin, place)
  mask = 1 << place
  !(mask & bin).zero?
end

p is_bit_set?(0b0101010, 0) # false
p is_bit_set?(0b0101010, 1) # true
p is_bit_set?(0b0101010, 2) # false
