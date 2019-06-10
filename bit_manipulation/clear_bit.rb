=begin
definition: clear bit
            to clear a bit is to set its value to 0

Logical Relations: 
    a) x & 0 will always return 0
    b) x & 1 will always return x

Masking:
  - from a), masking over the relevant bit with a 0 and 
    applying `&` will set bit to 0
  - from b), masking over the non-relevant bits with a 1
    and applying `&` will allow the bits to retain original values
=end 


def clear_bit(bin, place)
  mask = ~(1 << place)
  mask & bin
end


p clear_bit(0b01010101, 2).to_s(2)  # 01010001
p clear_bit(0b01010101, 0).to_s(2)  # 01010100
p clear_bit(0b01010101, 4).to_s(2)  # 01000101

