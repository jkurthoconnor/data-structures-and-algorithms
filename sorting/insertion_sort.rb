=begin
Insertion Sort

algorithm:
  - init sort_idx = 1
  - init curr_val = arr[sort_idx]
  - init shift_idx = sort_idx - 1

  - outer loop: while sort_idx < arr.size
    - gap shift loop: while shift_idx >= 0
      - if arr[shift_idx] > curr_val
        - swap values at shift_idx and shift_idx + 1
      - shift_idx -= 1

    - re-insert value: arr[shift_idx] = curr_val
    - sort_idx += 1  
    - curr_val = arr[sort_idx]
    - shift_idx = sort_idx - 1
    

=end
