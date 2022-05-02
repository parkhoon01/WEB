'use strict';
/**
클로져(Closure)
일반적으로 함수 내 지역변수는 함수 밖에서 참조할 수 밖에 없다.
클로져는 함수 내 지역변수를 함수 밖에서 참조 할 수 있다.
 */

function add(){
    let n = 0;
    return function(){
        return ++n;
    }
}

let increase = add();
console.log(increase());
console.log(increase());


function multiply(n){
    return function(){
        return n*=n;
    }
}

let num01 = multiply(10);
console.log(`num01: ${num01()}`);
console.log(`num01: ${num01()}`);