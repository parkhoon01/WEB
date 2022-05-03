'use strict';

// 더하기
function add(num01, num02){
    return num01 + num02;
}

// 곱하기
function multiply(num1, num2){
    return num1 * num2;
}

function surprise(callback){
    const result = callback(11,10);
    
    console.log(`result: ${result}`);
}

//
surprise(add);
surprise(multiply);