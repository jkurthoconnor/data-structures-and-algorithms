=begin
create a hash
  constraints:
    use  alpha chars as keys
    table size = 10
    store words as values

  hashing function:
    maps / translates keys into indices in underlying structures
      with alpha key, use position weighting to help avoid conflicts 


    algorithm:
      translate key into numerical value
        for each char, add to value the char's ascii value plus its order

      take numerical value and assign a slot  
        (remainder method): numerical value % table size


        TODO: 
          - collision handling
          - rehashing when load reaches .6
=end

class ToyHash
  def initialize(size)
    @size = size
    @storage = Array.new(size)
  end

  def set(key_value)
    key, value = key_value.split(":")
    @storage[get_hash(key).to_i] = value
  end

  def get(key)
    @storage[get_hash(key).to_i]
  end

  def inspect
    @storage
  end

  def values
    inspect.select { |e| e }
  end

  private

  def get_hash(key)
    value = key.chars.map.with_index { |char, idx| char.ord + idx }.sum
    value % @size
  end
end

hash = ToyHash.new(15)

hash.set('first:one')
hash.set('second:two')
hash.set('third:three')
hash.set('fourth:four')
hash.set('fifth:five')
hash.set('sixth:six')

p hash.inspect 
p hash.values 

p hash.get("first")
p hash.get("second")
p hash.get("third")
p hash.get("fourth")
p hash.get("fifth")
p hash.get("sixth")


