function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// in block
// in block


function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// in block
// out block

// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
// Error because x is already defined as a constant

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// in block
// out of block

// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   let x = 'out of block again'
//   console.log(x);
// }
// Error because x has already been defined in the outer block

function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`;
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuzz(array) {
  const result = [];
  for (let i = 0; i < array.length; i++) {
    let n = array[i];
    if (n % 15 === 0) {
      continue;
    } else if (n % 3 === 0 || n % 5 === 0) {
      result.push(n);
    } else {
      continue;
    }
  }
  return result;
}

function isPrime(number) {
  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes(n) {
  let sum = 0;
  let primeCounter = 0;
  let i = 2;
  while (primeCounter < n) {
    if (isPrime(i)) {
      sum += i;
      primeCounter++;
    }
    i++;
  }
  return sum;
}

function allOrNothing() {
  let mod = arguments[0];
  for (let i = 1; i < arguments.length; i++) {
    if (arguments[i] % mod !== 0) {
      return false;
    }
  }
  return true;
}
