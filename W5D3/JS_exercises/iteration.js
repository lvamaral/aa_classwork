"use strict";

Array.prototype.bubbleSort = function () {
  var sorted = false;
  var i = 0;

  while (sorted === false) {
    sorted = true;
    if (this[i] > this[i+1]) {
      sorted = false;
      this[i], this[i+1] = this[i+1], this[i];
    }
    i++;
  }

  return this;
};

Array.prototype.bubbleSort = function () {
  let sorted = false;

  while (sorted === false) {
    sorted = true;
    this.forEach( (el, idx) => {
      if (this[idx] > this[idx + 1]) {
        sorted = false;
        let temp = this[idx+1];
        this[idx+1] = this[idx];
        this[idx] = temp;
      }
    })
  }
  return this;
};

Array.prototype.subarrays = function () {
  let subs = [];

  this.forEach( (el, idx) => {
    this.forEach( (el2, idx2) => {
      let sub = this.slice(idx, idx2+1)

      if (sub.length === 0) {
        return;
      }
      subs.push(sub);
    })
  })
  return subs;
}

String.prototype.substrings = function () {
  let subs = [];

  for (let start = 0; start < this.length; start++) {
    for (let len = 1; (start + len) <= this.length; len++) {
      subs.push(this.slice(start, start + len));
    }
  }
  return subs;
}
