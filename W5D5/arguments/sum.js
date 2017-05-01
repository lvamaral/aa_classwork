function sumArgs () {
  const args = Array.from(arguments);
  let sum = 0;

  args.forEach( (arg) => {
    sum += arg;
  });
  return sum;
}

sumArgs([1,2,3]);

function sumRest (...args) {
  let sum = 0;

  args.forEach( (arg) => {
    sum += arg;
  });
  return sum;
}

sumRest(1,3,5);
