const readline = require('readline');

const reader = readline.createInterface({

  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor() {
    this.stack = [[3, 2, 1], [], []];
  }
}

Game.prototype.promptMove = function(callback) {
  console.log(`${this.stack[0]}`);
  console.log(`${this.stack[1]}`);
  console.log(`${this.stack[2]}`);

  reader.question("What stack do you want to take from?", function(startTowerIdx) {
    reader.question("What stack do you want to move to?", function(endTowerIdx) {
      callback(startTowerIdx, endTowerIdx);
    });
  });
};

Game.prototype.isValidMove = function(startTowerIdx, endTowerIdx) {
  //end tower empty?
  // last el of end tower > last el of start tower
  // start tower not empty
  if(this.stack[startTowerIdx].length === 0) {
    return false;
  } else if (this.stack[endTowerIdx][this.stack[endTowerIdx].length - 1]
    < this.stack[startTowerIdx][this.stack[startTowerIdx].length - 1]) {
    return false;
  }
  return true;
};

const x = new Game;
// x.promptMove(function(a,b) {
//   console.log(`${a}, ${b}`);
//   reader.close();
// });
x.isValidMove(0, 1);
