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
