const MovingObject = require ("./moving_object.js");
const Util = require ("./utils.js");

Util.inherits(Asteroid, MovingObject);

function Asteroid (pos) {
  const COLOR = 'red';
  const RADIUS = 5;

  const options = {
    pos: pos,
    color: COLOR,
    rad: RADIUS,
    vel: Util.randomVec(5)
  };

  MovingObject.call(options);
}

module.exports = Asteroid;
