function titleize(nameArray, callback) {
  let titleizedNames = nameArray.map(function(name) {
    return `Mx. ${name} Jingleheimer Schmidt`;
  });

  callback(titleizedNames);
}

function printCallback(array) {
  array.forEach(el => {
    console.log(el);
  });
}

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
  this.trumpet = function () {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRR!!!!!'`);
  };
  this.grow = function () {
    this.height += 12;
  };
  this.addTrick = function (trick) {
    this.tricks.push(trick);
  };
  this.play = function () {
    let i = Math.floor(Math.random() * this.tricks.length);
    let trick = this.tricks[i];
    // let s = `${this.name} is ${trick}!`
    console.log(`${this.name} is ${trick}!`);
  };
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

// herd.forEach(Elephant.paradeHelper)

function dinerBreakfast() {
  let order = 'cheesy scrambled eggs';
  let say = function(additionalOrder) {
    if (additionalOrder !== undefined) {
      order += ` and ${additionalOrder}`;
    }
    let s = "I'd like " + order + " please.";
    console.log(s);
  };
  say();
  return say;
}
