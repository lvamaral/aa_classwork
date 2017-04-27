# phase 1: 0(n * n!)

def first_anagram?(str1, str2)
  perms = str1.chars.permutation.to_a

  perms.include?(str2.chars)
end

p first_anagram?("pat", "lap")
p first_anagram?("pal", "lap")


#phase 2: polynomial O(n^2)


def second_anagram?(str1, str2)
  str2_dup = str2.chars.dup
  str1_dup = str1.chars.dup

  str2_dup.reject! { |el| str1.include?(el) }
  str1_dup.reject! { |el| str2.include?(el) }

  str1_dup.empty? && str2_dup.empty?
end

p second_anagram?("pat", "lap")
p second_anagram?("pal", "lap")



#phase 3: O(n log n)

def third_anagram?(str1, str2)
  sorted_str1 = str1.chars.sort
  sorted_str2 = str2.chars.sort

  sorted_str1 == sorted_str2
end

p third_anagram?("pat", "lap")
p third_anagram?("pal", "lap")


#phase 4: O(n)

def fourth_anagram?(str1, str2)
  str1_hash = Hash.new(0)

  str1.chars.each do |letter|
    str1_hash[letter] += 1
  end

  str2.chars.each do |letter|
    str1_hash[letter] -= 1
  end

  str1_hash.values.all? { |val| val == 0}
end

p fourth_anagram?("pat", "lap")
p fourth_anagram?("pal", "lap")
