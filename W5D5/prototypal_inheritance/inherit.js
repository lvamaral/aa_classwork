// Surrogate inherits

// Function.prototype.inherits = function (parent) {
//   const Surrogate = function() {};
//   Surrogate.prototype = parent.prototype;
//   this.prototype = new Surrogate;
//   this.prototype.constructor = this;
// };


Function.prototype.inherits = function (parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
};

function MovingObject (speed, color) {
  this.speed = speed;
  this.color = color;
}

function Ship (speed, color) {
  MovingObject.call(this, speed, color);
}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);
