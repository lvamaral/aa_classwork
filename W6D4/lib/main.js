const DomNodeCollection = require('./dom_node_collection.js');

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
