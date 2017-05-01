//We are defining myEach, so it has to be set to equal some new function.
Array.prototype.myEach = function (some_method) {
  for (let i = 0; i < this.length; i++) {
    some_method(this[i]);
  }
  return this;
};

function doubler(integer) {
  return (integer * 2);
};

Array.prototype.myMap = function (some_method) {
  const mapped = [];

  for (let i = 0; i < this.length; i++) {
    mapped.push(some_method(this[i]));
  }
  return mapped;
};

Array.prototype.myNewMap = function (cb) {
  let mapped = [];

  this.myEach( (el) => {
    mapped.push(cb(el));
  })
  return mapped;
};

Array.prototype.myInject = function (cb) {
  var acc = this[0];
  this.slice(1).myEach( (el) => {
    acc = cb(acc, el);
  })
  return acc;
};

function adder (acc, value) {
  return acc += value;
};

arr.reduce(:+)

arr.map{}

def self.my_inject(acc, &prc)
  i = 0
  if acc.nil?
    acc = self[i]
    i += 1
  end

  self[1..-1].my_each do |i|
    acc = prc.call(acc, self[i])
  end

  while i < self.length
    acc = prc.call(acc, self[i])
    i += 1
  end

  acc
end
