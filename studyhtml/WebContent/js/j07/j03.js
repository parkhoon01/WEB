'use strict';

let numArray = [1,2,3,4,5,6,7];
let sum = 0;

numArray.forEach(function(value,index,array){
//    console.log(`value: ${value}`);
//    console.log(`index: ${index}`);
//    console.log(`index: ${index},${array}`);
    sum += value;
});

console.log(`sum=${sum}`);

// map() : 기존 배열을 이용해 새로운 배열을 생성

let base = [1,2,3];

let newArray = base.map(function(value,index,array){
    console.log(`value: ${value}, index: ${index}, array: ${array}`);
    return value*2;
});

console.log(`newArray: ${newArray.toString()}`);

// filter() : 조건에 맞는 배열의 요소들만 걸러 새로운 배열 생성

let data = ['JAVASCRIPT',20,30,'JQUERY'];

let numArray02 = data.filter(function(value,index,array){
   console.log(`value: ${value}, index: ${index}, array: ${array}`); 
   console.log(`type: ${typeof value}`);
   return typeof value == 'number';
});

console.log(`${numArray02.toString()}`);