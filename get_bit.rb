=begin

definition: get bit
  to get a bit is to get the bit (0 or 1) in a specified place (not to get
    the place value)

Logical Relations:

  a) `x & 1` will always return `x`
  b) `x & 0` will always return `0`

Masking:
  mask is set like 0010000, i.e. with only 1 at desired place
  - with this mask the return is all 0s and whatever value is 
    at the place; so return is whatever value is held in the bin after masking;
  - return evaluation:
    - if it is 0, then we know the bit at place is 0
    - if it is not 0, then we know bit at place is 1
=end

def get_bit(bin, place)
  mask = 1 << place  
  (bin & mask != 0) ? 1 : 0
end


p get_bit(0b110101, 3)  # 0
p get_bit(0b010001, 2)  # 0
p get_bit(0b010001, 4)  # 1
