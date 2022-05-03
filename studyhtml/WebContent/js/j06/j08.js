'use strict';

// Number 객체 생성
let num01 = new Number(10);

let num02 = 12;

console.log(`num01+num02 = ${num01+num02}`);

let num = 328.575;
// toFixed() : toFixed(n)일 때 n값 만큼의 소수점 자릿수를 만들어 준다.
console.log(`num.toFixed(1): ${num.toFixed(1)}`);
console.log(`num.toFixed(2): ${num.toFixed(2)}`);
console.log(`num.toFixed(): ${num.toFixed()}`);

num = 12;

//toString(n)일때 n값의 진수로 만들어 줍니다.
console.log(`num.toString(2): ${num.toString(2)}`);