function curriedSum(numArgs) {
  const numbers = [];

  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      let sum = 0;
      numbers.forEach( (i) => {
        sum += i;
      });
      return sum;
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

// const sum = curriedSum(3);
// console.log(sum(5)(7)(8));

Function.prototype.currySpread = function(numArgs) {
  const args = [];
  const outerFunc = this;

  function innerFunc (arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return outerFunc(...args);
    } else {
      return innerFunc;
    }
  }
  return innerFunc;
};

function sumRest (...args) {
  let sum = 0;

  args.forEach( (arg) => {
    sum += arg;
  });
  return sum;
}

// console.log(sumRest.currySpread(3)(1)(3)(5));


Function.prototype.curryApply = function(numArgs) {
  const args = [];
  const outerFunc = this;

  function innerFunc (arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return outerFunc.apply(numArgs, args);
    } else {
      return innerFunc;
    }
  }
  return innerFunc;
};

console.log(sumRest.curryApply(3)(1)(3)(5));
