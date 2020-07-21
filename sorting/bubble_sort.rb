=begin
BUBBLE SORT

mental model: 
  multiple passthroughs
  the highest unsorted value is pushed 'up' (via swaps) to its appropriate place in the array 
  That is, at each passthrough, the highest unsorted value Bubbles Up into place

use case
time: O(N^2), but note that in addition to stepping through the elements for comparisions, there are potentially n - 1 swaps in the unsorted portion.

space: O(1)
=end

def bubble_sort(arr)
  swapped = true

  while swapped
    swapped = false
    left, right = 0, 1

    while right < arr.length
      if arr[left] > arr[right]
        arr[left], arr[right] = arr[right], arr[left]
        swapped = true
      end

      left += 1
      right += 1
    end
  end

  arr
end

