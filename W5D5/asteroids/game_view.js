const Game = require ("./game.js");

function GameView(ctx) {
  this.game = new Game(ctx);
}

GameView.prototype.start = function () {
  setInterval(this.game.moveObjects.bind(this.game), 20);
  setInterval(this.game.draw.bind(this.game), 20);
};

module.exports = GameView;
