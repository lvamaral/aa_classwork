/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 6);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

const Util = {
  inherits(childClass, parentClass) {
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.prototype.constructor = childClass;
  },

  // Return a randomly oriented vector with the given length.
  randomVec (length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  // Scale the length of a vector by the given amount.
  scale (vec, m) {
    return [vec[0] * m, vec[1] * m];
  }

};

module.exports = Util;


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const MovingObject = __webpack_require__ (4);
const Util = __webpack_require__ (0);

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


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const Asteroid = __webpack_require__ (1);
const Util = __webpack_require__ (0);

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


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__ (2);

function GameView(ctx) {
  this.game = new Game(ctx);
}

GameView.prototype.start = function () {
  setInterval(this.game.moveObjects.bind(this.game), 20);
  setInterval(this.game.draw.bind(this.game), 20);
};

module.exports = GameView;


/***/ }),
/* 4 */
/***/ (function(module, exports) {

function MovingObject(options) {
  this.pos = options['pos'];
  this.vel = options['vel'];
  this.rad = options['rad'];
  this.color = options['color'];
}

MovingObject.prototype.draw = function (ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], 20, 0, 2 * Math.PI, true);
  ctx.strokeStyle = "white";
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fill();
};

MovingObject.prototype.move = function () {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
};

module.exports = MovingObject;


/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

const GameView = __webpack_require__ (3);

document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("game-canvas");
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext("2d");

  const gv = new GameView(ctx);
  gv.start();
});


/***/ }),
/* 6 */
/***/ (function(module, exports, __webpack_require__) {

const MovingObject = __webpack_require__ (4);
const Util = __webpack_require__ (0);
const Game = __webpack_require__ (2);
const GameView = __webpack_require__ (3);
const Asteroid = __webpack_require__ (1);
const Asteroids = __webpack_require__ (5);

window.MovingObject = MovingObject;
window.Util = Util;
window.Game = Game;
window.GameView = GameView;
window.Asteroid = Asteroid;
window.Asteroids = Asteroids;


/***/ })
/******/ ]);