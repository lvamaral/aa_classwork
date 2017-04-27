#brute force : O(n**2)

def bad_two_sum?(arr, target)

  arr.each_index do |idx1|
    arr.each_index do |idx2|
      next if idx1 == idx2
      return true if arr[idx1] + arr[idx2] == target
    end
  end

  false
end

p bad_two_sum?([0, 1, 5, 7], 6)
p bad_two_sum?([0, 1, 5, 7], 10)

#sorting : O(n log n)

def okay_two_sum?(arr, target)
  arr.sort!
  smaller_arr = arr.select { |el| el <= target }
  pivot = smaller_arr.last
  return true if smaller_arr.include?(target - pivot)
  false
end

p okay_two_sum?([0, 1, 5, 7], 6)
p okay_two_sum?([0, 1, 5, 7], 10)
p okay_two_sum?([7, 5, 1, 0], 6)

#hash map : n + n + n => O(n)

def two_sum?(arr, target)

  hash = {}

  arr.each do |el|
    hash[el] = el unless el > target
  end

  max = hash.keys.max

  hash.keys.include?(target - max)
end

p two_sum?([0, 1, 5, 7], 6)
p two_sum?([0, 1, 5, 7], 10)
p two_sum?([7, 5, 1, 0], 6)
