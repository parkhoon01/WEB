'use strict';

/*
var는 함수{}에서만 지역 변수 존재
(블록{}, 제어문 블록{}에서는 지역 변수가 존재 하지 않는다.)
 */

var num = 11;
{
    var num = 20;
    console.log(`num: ${num}`);
}
console.log(`num: ${num}`);

/* 
let, const는 블록{}, 제어문{}에서도 지역변수를 선언 할 수 있다.
*/

let num01 = 11;
{
    let num01 = 20;
    console.log(`num01: ${num01}`);
}
console.log(`num01: ${num01}`);

const num02 = 11;
{
    const num02 = 23;
    console.log(`num02: ${num02}`);
}
console.log(`num02: ${num02}`);