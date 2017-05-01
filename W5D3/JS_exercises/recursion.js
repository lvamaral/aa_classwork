function range (start, end) {
  if (start > end) {
    return [];
  }
  let nums = range(start+1, end)
  return [start].concat( nums );
};

function recursiveSum (arr) {
  if (arr.length === 0) {
    return 0;
  }
  if (arr.length === 1) {
    return arr[0];
  }
  let rest = recursiveSum (arr.slice(1))
  return arr[0] += rest;
}

function iterativeSum (arr) {
  let acc = 0;
  for (let i = 0; i < arr.length; i++) {
    acc += arr[i];
  }
  return acc;
}

function exponent1 (b, n) {
  if (n === 0) {
    return 1;
  }
  return b * exponent1 (b, n-1);
}

function exponent2 (b, n) {
  if (n === 0) {
    return 1;
  }
  if (n === 1) {
    return b;
  }
  if (n % 2 === 0) {
    return b * exponent2(b, n/2);
  }
  if (n % 2 != 0) {
    return b * (exponent2(b, (n - 1) / 2) * exponent2(b, (n - 1) / 2));
  }
}

function iterativeFibonacci (n) {
  let sequence = [1, 1];

  while (sequence.length < n) {
    let last_two_sum = sequence.slice(-2).reduce(adder);
    sequence.push(last_two_sum);
  }
  return sequence;
}

function adder (acc, value) {
  return acc += value;
};

function recursiveFibonacci (n) {

  if (n <= 2) {
    return [1, 1].slice(0, n);
  }
  let fibs = recursiveFibonacci(n - 1);
  fibs.push(fibs[fibs.length-2] + fibs[fibs.length-1]);
  return fibs;
}

function bsearch (arr, target) {
  if (arr.length === 0) {
    return null;
  }
  let mid = Math.floor(arr.length / 2);

  if (arr[mid] === target) {
    return mid;
  }
  let left_search = bsearch(arr.slice(0,mid), target);
  let right_search = bsearch(arr.slice(mid + 1), target);

  if (arr[mid] > target) {
    return left_search;
  } else if (right_search !== null){
    return mid + 1 + right_search;
  } else {
    return null;
  }
}
