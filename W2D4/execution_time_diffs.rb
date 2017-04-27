# phase 1 : quadratic : O(n**2)

def my_min1(list)

  smallest = list.first

  i = 0
  while i < list.length
    j = 1
    while j < list.length
      if list[j] < smallest
        smallest = list[j]
      end
      j += 1
    end
    i += 1
  end

  smallest
end

p my_min1([0, 3, 5, 4, -5, 10, 1, 90])

# phase 2 : linear : O(n)

def my_min2(list)

  smallest = list.shift

  list.each do |el|
    smallest = el if el < smallest
  end

  smallest

end
p my_min2([0, 3, 5, 4, -5, 10, 1, 90])

# phase 1 : cubic : O(n**3)


def sub_sums1(array)
  subs = []

  array.each_index do |idx1|
    (idx1..array.length - 1).each do |idx2|
      subs << array[idx1..idx2]
    end
  end

  subs.map { |sub| sub.reduce(:+) }.max

end

p sub_sums1([2, 3, -6, 7, -6, 7])

#phase 2: 0(n)

def sub_sums2(arr)
  largest_sum = arr.max

  pivot_idx = arr.index(largest_sum)

  if arr.drop(pivot_idx).reduce(:+) > largest_sum
    largest_sum = arr.drop(pivot_idx).reduce(:+)
  end

  if pivot_idx == 0
    if arr.take(pivot_idx + 2).reduce(:+) > largest_sum
      largest_sum = arr.take(pivot_idx + 2).reduce(:+)
    end
  else
    if arr.take(pivot_idx + 1).reduce(:+) > largest_sum
      largest_sum = arr.take(pivot_idx + 1).reduce(:+)
    end
  end

  largest_sum
end

p sub_sums2([2, 3, -6, 7, -6, 7])
p sub_sums2([7, 6, -1, -5, 7, 5])
p sub_sums2([-5, -1, -3])
