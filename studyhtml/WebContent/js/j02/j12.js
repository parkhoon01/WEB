'use strict';

let x = 3;
let y = 2;

console.log(`x: ${x}, y: ${y}`);
//x: 3, y: 2

console.log(`${x}+=${y} => ${x += y}`);     // x = x+y
//3+=2 => 5

x = 3;
y = 2;
console.log(`${x}-=${y} => ${x -= y}`);     // x = x-y
//3-=2 => 1

x = 3;
y = 2;
console.log(`${x}*=${y} => ${x *= y}`);     // x = x*y
//3*=2 => 6

x = 3;
y = 2;
console.log(`${x}/=${y} => ${x /= y}`);     // x = x/y
//3/=2 => 1.5