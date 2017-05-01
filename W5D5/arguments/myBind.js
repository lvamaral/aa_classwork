class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

// Function.prototype.myBind = function (ctx) {
//   const outerArgs = Array.from(arguments);
//   const outerCtx = this;
//
//   return function() {
//     const innerArgs = Array.from(arguments);
//     outerCtx.apply(outerArgs[0], outerArgs.slice(1).concat(innerArgs));
//   };
// };

Function.prototype.myBind = function (...outerArgs) {
  const outerCtx = this;

  return function(...innerArgs) {
    outerCtx.apply(outerArgs[0], outerArgs.slice(1).concat(innerArgs));
  };
};

markov.says.myBind(breakfast, "meow", "Kush")();
markov.says.myBind(breakfast)("meow", "a tree");
markov.says.myBind(breakfast, "meow")("Markov");
