=begin
  definition:
    flipping a bit is changing it from 1 to 0 or 0 to 1

Logical Relations:
  a) `x ^ 1` will always return ~x (i.e., its opposite value)
  b) `x ^ 0` will always return x

Masking:
  - from a), setting a mask with 1 in the desired place will flip the bit
    when XOR is applied.

  - from b), setting a mask with 0 in non-target places will allow the 
    remaining bits to persist unchanged in the return
=end


def flip_bit_convenience(bin, place)
  bit = get_bit(bin, place)
  bit ? clear_bit(bin, place) : set_bit(bin, place)
end

def flip_bit(bin, place)
  mask = 1 << place
  bin ^ mask
end


p flip_bit(0b1011, 0).to_s(2)  # 1010
p flip_bit(0b1011, 1).to_s(2)  # 1001
p flip_bit(0b1011, 3).to_s(2)  # 0011

