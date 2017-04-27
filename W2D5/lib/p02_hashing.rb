class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 1267634799471204388 if self.empty?
    hashed = []

    self.each_with_index do |el, idx|
      hashed << el.hash * idx
    end
    hashed.reduce(:-)
  end
end

class String
  def hash
    bytes = []
    self.each_byte{|el| bytes << el}
    bytes.join("").to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hashed = 0
    self.keys.each do |key|
      hashed += key.object_id
    end
    hashed
  end
end

{{a: 1, b: 2, c:3} => {b:2, a:1, c:3}}
