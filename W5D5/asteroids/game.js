const Asteroid = require ("./asteroid.js");
const Util = require ("./utils.js");

function Game(ctx) {
  debugger;
  const DIM_X = 500;
  const DIM_Y = 500;
  const NUM_ASTROIDS = 5;
  this.asteroids = [];
  this.ctx = ctx;

  for (var i = 0; i < NUM_ASTROIDS; i++) {
    this.asteroids.push(this.addAsteroids);
  }
}

Game.prototype.addAsteroids = function () {
  return new Asteroid(this.randomPosition);
};

Game.prototype.randomPosition = function () {
  const x = Math.floor(Math.random() * this.DIM_X);
  const y = Math.floor(Math.random() * this.DIM_Y);
  return [x, y];
};

Game.prototype.draw = function () {
  this.ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);

  for (var i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].draw(this.ctx);
  }
};

Game.prototype.moveObjects = function () {
  this.ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);

  for (var i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }
};

module.exports = Game;
