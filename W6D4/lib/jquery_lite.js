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
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DomNodeCollection = __webpack_require__(1);

const $l = function(selectors) {
  if(typeof selectors === "string") {
    let elementList = document.querySelectorAll(selectors);
    let elementListArr = Array.from(elementList);
    return new DomNodeCollection(elementListArr);

  } else if(selectors instanceof HTMLElement) {
    let selectorsArr = [selectors];
    return new DomNodeCollection(selectorsArr);
  }
};

window.$l = $l;


/***/ }),
/* 1 */
/***/ (function(module, exports) {

function DomNodeCollection (HTMLElements){
  this.nodes = HTMLElements;
}

DomNodeCollection.prototype.html = function(string) {
  if (string) {
    const HTMLString = string;
    this.nodes.forEach((node) => {
      node.innerHTML = HTMLString;
    });
  } else {
    return this.nodes[0].innerHTML;
  }
  return this.nodes;
};

DomNodeCollection.prototype.empty = function () {
  this.nodes.forEach((node) => {
    node.innerHTML = "";
  });
  return this.nodes;
};

DomNodeCollection.prototype.append = function(children) {
  if (typeof children === 'string') {
    this.nodes.forEach((node) => {
      node.innerHTML += children;
    });
  } else if (children instanceof HTMLElement) {
    this.nodes.forEach((node) => {
      node.innerHTML += children.outerHTML;
    });
  } else {
    this.nodes.forEach((node) => {
      children.nodes.forEach((child) =>{
        node.appendChild(child);
      });
    });
  }

  return this.nodes;
};

DomNodeCollection.prototype.attr = function(key, val) {
  if (typeof val === "string") {
    this.nodes.forEach( node => node.setAttribute(key, val) );
  } else {
    return this.nodes[0].getAttribute(key);
  }
};

DomNodeCollection.prototype.addClass = function (_class) {
  this.nodes.forEach((node) => {
    node.classList.add(_class);
  });
  return this.nodes;
};

DomNodeCollection.prototype.removeClass = function (_class) {
  this.nodes.forEach((node) => {
    node.classList.remove(_class);
  });
  return this.nodes;
};

module.exports = DomNodeCollection;


/***/ })
/******/ ]);