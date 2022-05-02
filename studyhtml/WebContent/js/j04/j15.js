//'use strict';

// 문자를 자바스크립트 코드로 변경

// let 변수는 안됨, var 변수만 가능

var str01 = 'var num01 = 11';
var str02 = 'var num02 = 13';

eval(str01);
eval(str02);
// num01 + num02 = 24

console.log(`num01 + num02= ${num01+num02}`);