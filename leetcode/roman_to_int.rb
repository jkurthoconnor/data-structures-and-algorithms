# LeetCode 13. Roman to Integer
#
#Problem: Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

#Symbol       Value
#I             1
#V             5
#X             10
#L             50
#C             100
#D             500
#M             1000

#For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.

#Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

#    I can be placed before V (5) and X (10) to make 4 and 9. 
#    X can be placed before L (50) and C (100) to make 40 and 90. 
#    C can be placed before D (500) and M (1000) to make 400 and 900.

#Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.

#Example 1:

#Input: "III"
#Output: 3

#Example 2:

#Input: "IV"
#Output: 4

#Example 3:

#Input: "IX"
#Output: 9

#Example 4:

#Input: "LVIII"
#Output: 58
#Explanation: L = 50, V= 5, III = 3.

#Example 5:

#Input: "MCMXCIV"
#Output: 1994
#Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

##
# I: string of Roman numerals
# O: integer value of Roman input
#
# D: 
#   hash to hold value conversions
#   hash to hold special case conversions
#   value integer to hold running value; init to 0
#
#
#A: iterate through Roman numeral chars (manually)
#      if ch & ch[idx + 1] is a special case I, X, C
#        value += special-case[ch & ch[idx + 1] 
#      else
  #      value += converter[ch] 
#      end
#
#      value

# TIME: O(N) "faster than 99.43% Ruby submissions; Memory usage less than 100%
def roman_to_int(roman)
  dictionary = { "I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000, "IV" => 4, "IX" => 9, "XL" => 40, "XC" => 90, "CD" => 400, "CM" => 900}
  value = 0
  idx = 0

  while idx < roman.length
    if dictionary[roman[idx..idx + 1]]
      value += dictionary[roman[idx..idx + 1]]
      idx += 1
    else
      value += dictionary[roman[idx]]
    end
    idx += 1
  end

  value
end

# Algo 2: O(N) with buffer (see BUG)

=begin
def roman_to_int(roman)
  dictionary = { "I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
  value = 0
  buffer = []

  roman.each_char do |ch| 
    if ch.match?(/[IXC]/) && buffer.empty?
      buffer.push(ch)
    elsif !buffer.empty? && ch.match?(/[VXLCDM]/)
      value += calculateIrregularity(buffer.pop, ch, dictionary)
    elsif !buffer.empty? # BUG:does not add /[IXC]/ to buffer if buffer already occupied
      value += dictionary[buffer.pop] + dictionary[ch]
    else
    value +=  dictionary[ch] 
    end
  end

  buffer.empty? ? value : value += dictionary[buffer.pop]
end

def calculateIrregularity(num1, num2, values)
  if ((num1 == "I" && num2.match?(/[VX]/)) || (num1 == "X" && num2.match?(/[LC]/)) || (num1 == "C" && num2.match?(/[DM]/)))

    return values[num2] - values[num1]
  else
    return values[num1] + values[num2]
  end
end
=end

p roman_to_int("III") # 3
p roman_to_int("IV") # 4
p roman_to_int("IX") # 9
p roman_to_int("LVIII") # 58
p roman_to_int("MCMXCIV") # 1994
p roman_to_int("MDCCCLXXXIV") # 1884 (algo 2 actual: 1886)
