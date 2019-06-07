=begin
definition: set bit
  to set a bit is to ensure the bit is 1

Logical Relations:
  a) `x | 1` will always return 1
  b) `x | 0` will always return x

Masking:
  - from a), setting a mask with 1 at appropriate place and
    applying `|` will return 1

  - from b), setting a mask with 0 at all non-relevant places
    and applying `|` will allow non-relevant bits to remain the same
=end

def set_bit(bin, place)
  mask = 1 << place
  bin | mask
end

p set_bit(0b110001, 2).to_s(2) # 110101
p set_bit(0b110001, 0).to_s(2)# 110001
p set_bit(0b110001, 3).to_s(2) # 111001
