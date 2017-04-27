# [1, 2, 6, 4, 8], 3 => [1, 2, 6], [2, 6, 4], [6, 4, 8] #each_cons => 2

#naive : O(n**2)

def windowed_max_range(arr, w)
  current_max_range = nil

  windows = arr.each_cons(w)

  windows.each do |window|
    difference = window.max - window.min

    if current_max_range.nil?
      current_max_range = difference
    elsif difference > current_max_range
      current_max_range = difference
    end
  end

  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

#optimized:

def op_windowed_max_range(arr, w)
  current_max_range = nil
  stacked = Stack.new(arr)
end

p op_windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p op_windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p op_windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p op_windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
