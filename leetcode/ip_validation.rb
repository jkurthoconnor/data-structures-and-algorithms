# LeetCode 468. Validate IP Address
#
# Check if string is a valid ipv4 or ipv6 address, or neither
#
# I: string 
# O: string: "IPv4", "IPv6", or "Neither"
#
# Clarification:
#   IPv4: four decimal numbers,  each (0..255),
#         numbers / groups separated by "."
#         ** leading zeros are invalid
#
#   IPv6: eight groups of four hexadecimal digits [a-fA-F0-9]
#         groups separated by ":"
#         ** leading zeros MAY be omitted unless doing so eliminates the group
#           - extra zeros are invalid: 
#             i.e. no leading zero if group becomes 5 digits
#             i.e. if value of group is 0, must represent with single 0

# Examples:
# Example 1:

# Input: "172.16.254.1"
# Output: "IPv4"
# Explanation: This is a valid IPv4 address, return "IPv4".

# Example 2:

# Input: "2001:0db8:85a3:0:0:8A2E:0370:7334"
# Output: "IPv6"
# Explanation: This is a valid IPv6 address, return "IPv6".

# Example 3:

# Input: "256.256.256.256"
# Output: "Neither"

# Explanation: This is neither a IPv4 address nor a IPv6 address.


# Model: pattern matching

#

def valid_ip_address(ip)
  return "Neither" if ip.match?(/(^[.:])|([.:]$)/)
  groups = ip.split(/[.:]/)

  validate_ipv4(groups) || validate_ipv6(groups) || "Neither"
end

def validate_ipv4(ip_groups)
  return false if ip_groups.size != 4

  ip_groups.each do |group|
    num = group.to_i(10)
    if (group.size > 1 && group.start_with?("0")) || !(0..255).include?(num) || !group.match?(/^\d+$/)
      return false
    end
  end

    "IPv4"
end

def validate_ipv6(ip_groups)
  return false if ip_groups.size != 8

  ip_groups.each do |group|
    if !(1..4).include?(group.size) || group.match?(/\H/)
      return false
    end
  end

    "IPv6"
end





p valid_ip_address("172.16.254.1")     # ipv4
p valid_ip_address("172.16.254.01")     # neither
p valid_ip_address("172.1e.254.01")     # neither
p valid_ip_address("256.256.256.256")  # neither
p valid_ip_address("2001:0db8:85a3:0:0:8A2E:0370:7334") # ipv6
p valid_ip_address("2001:0db8:85a3:0000:0000:8A2E:0370:7334") # ipv6
p valid_ip_address("2001:0db8:85a3:0:0:8a2e:0370:7334") # ipv6
p valid_ip_address("2001:0db8:85a3::8A2E:0370:7334") # neither
p valid_ip_address("2001:0db8:85a3:0:0:8A2E:0370:7334:") # neither
