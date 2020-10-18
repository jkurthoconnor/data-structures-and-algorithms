# FIRST COME FIRST SERVED (Interview Cake)
# https://www.interviewcake.com/question/python3/cafe-order-checker?course=fc1&section=array-and-string-manipulation
# 
 # Problem statement:
 # I have two registers: one for take-out orders, and the other for the other folks eating inside the cafe. All the customer orders get combined into one list for the kitchen, where they should be handled first-come, first-served.


 #    The take-out orders as they were entered into the system and given to the kitchen. (take_out_orders)
 #    The dine-in orders as they were entered into the system and given to the kitchen. (dine_in_orders)
 #    Each customer order (from either register) as it was finished by the kitchen. (served_orders)

# Given all three lists above, write a function to check that my service is first-come, first-served. All food should come out in the same order customers requested it.

# We'll represent each customer order as a unique integer. The order numbers do not need to be sequential.
##############

# in: 3 lists
# out: boolean


# algo:
# at its core, the problem is to ensure the served list:
    # - contains each order placed & no extra orders
    # - is ordered such that no served order is served out of place with respect to its own list

# track two idx: in_idx, out_idx
# the in and out idx track the next-order-from-the-list

# iterate through served:
#   if the served item is the next on one of the order lists, increment that list
#   if the served item is not next on either list, return False

#   
def is_first_come_first_served(dine_in, carry_out, served):


class TestOrders:
    def test_both_registers_have_same_number_of_orders(self):
        assert is_first_come_first_served([1, 4, 5], [2, 3, 6], [1, 2, 3, 4, 5, 6]) == True

    def test_registers_have_different_lengths(self):
        assert is_first_come_first_served([1, 5], [2, 3, 6], [1, 2, 6, 3, 5]) == False

    def test_one_register_is_empty(self):
        assert is_first_come_first_served([], [2, 3, 6], [2, 3, 6]) == True

    def test_served_orders_is_missing_orders(self):
        assert is_first_come_first_served([1, 5], [2, 3, 6], [1, 6, 3, 5]) == False

    def test_served_orders_has_extra_orders(self):
        assert is_first_come_first_served([1, 5], [2, 3, 6], [1, 2, 3, 5, 6, 8]) == False

    def test_one_register_has_extra_orders(self):
        assert is_first_come_first_served([1, 9], [7, 8], [1, 7, 8]) == False

    def test_one_register_has_unserved_orders(self):
        assert is_first_come_first_served([55, 9], [7, 8], [1, 7, 8, 9]) == False

    def test_order_numbers_are_not_sequential(self):
        assert is_first_come_first_served([27, 12, 18], [55, 31, 8], [55, 31, 8, 27, 12, 18]) == True

