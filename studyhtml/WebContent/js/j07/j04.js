'use strict';

// 1~100 배열 설정, 이중에 행운의 숫자 1개 출력

let luckyNumber = [];
for(let i=1; i<=100; i++){
    luckyNumber.push(i);
}

console.log(`luckyNumber.toString():${luckyNumber.toString()}`);

//Math.random() 함수는 0 이상 1 미만의 구간에서 근사적으로 균일한(approximately uniform) 부동소숫점 의사난수를 반환하며, 이 값은 사용자가 원하는 범위로 변형할 수 있다.
// 난수 생성 알고리즘에 사용되는 초기값은 구현체가 선택하며, 사용자가 선택하거나 초기화할 수 없다.

console.log(`Math.random(): ${Math.floor(Math.random() * luckyNumber.length)}`);
let idx = Math.floor(Math.random() * luckyNumber.length);
console.log(`luckyNumber: ${luckyNumber[idx]}`);