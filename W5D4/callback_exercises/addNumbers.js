const readline = require('readline');

const reader = readline.createInterface({

  input: process.stdin,
  output: process.stdout
});

const addNumbers = function(sum = 0, numsLeft, completionCallback) {
  let newSum = sum;

  if (numsLeft === 0) {
    completionCallback(newSum);
    reader.close();
  }

  if (numsLeft > 0) {
    reader.question('Choose a number?', function(num) {
      let newNum = parseInt(num);
      newSum += newNum;
      numsLeft -= 1;
      console.log(newSum);
      return addNumbers(newSum, numsLeft, completionCallback);
    });
  }
};


addNumbers(0, 3, function(sum){
  console.log(`Total Sum: ${sum}`);
});
