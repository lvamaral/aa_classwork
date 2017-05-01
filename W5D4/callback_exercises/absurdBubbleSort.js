const readline = require('readline');

const reader = readline.createInterface({

  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} greater than ${el2}?`, function(response) {
    return (response === "yes") ? callback(true) : callback(false);
  });

}

// askIfGreaterThan(5, 3, function(cond) {
//   if (cond === true) {
//     console.log("You are correct");
//   } else {
//     console.log("You are wrong.");
//   }
// });

function innerBubbleSortLoop(arr, i, madeAnySwaps, retryIfSwaps) {
  if (i === arr.length - 1) {
    retryIfSwaps(madeAnySwaps);
  }
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i+1], function(isGreaterThan) {
      madeAnySwaps = false;
      if (isGreaterThan) {
        let temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i+1] = temp;
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, (i + 1), madeAnySwaps, retryIfSwaps);
    });
  }
}

function absurdBubbleSort(arr, sortCompletionCallBack) {
  console.log("45");
  function retryIfSwaps(madeAnySwaps) {
    if (madeAnySwaps === true) {
      innerBubbleSortLoop(arr, 0, false, retryIfSwaps);
    } else {
      sortCompletionCallBack(arr);
    }
  }
  innerBubbleSortLoop(arr, 0, false, retryIfSwaps);
}

absurdBubbleSort([5, 3, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
